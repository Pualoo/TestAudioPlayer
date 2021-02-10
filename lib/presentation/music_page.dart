import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_audio_player/logic/Cubits/App/app_cubit.dart';
import 'package:test_audio_player/presentation/music_player.dart';

class MusicPage extends StatefulWidget {
  @override
  MusicPageState createState() => MusicPageState();
}

class MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(state.musicName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 100.0,
                ),
              ),
              Container(
                child: MusicPlayer(),
              )
            ],
          ),
        ),
      );
    });
  }
}
