import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_audio_player/logic/Cubits/App/app_cubit.dart';
import 'package:test_audio_player/logic/cubits/player/player_cubit.dart';
import 'package:test_audio_player/presentation/music_player.dart';

class MusicPage extends StatefulWidget {
  @override
  MusicPageState createState() => MusicPageState();
}

class MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var appCubit = BlocProvider.of<AppCubit>(context);
          var playerCubit = BlocProvider.of<PlayerCubit>(context);
          List<String> listMusic = appCubit.getListMusic();
          return Scaffold(
            appBar: AppBar(
              title: Text(state.musicName),
            ),
            drawer: Drawer(
              child: ListView.builder(
                itemCount: listMusic.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ListTile(
                    title: Text(listMusic[index]),
                    onTap: () {
                      appCubit.setMusic(listMusic[index]);
                      playerCubit.resetPlayer();
                    },
                  );
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                      size: 150.0,
                    ),
                  ),
                  Container(
                    child: MusicPlayer(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
