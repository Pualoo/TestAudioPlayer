import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_audio_player/logic/Cubits/App/app_cubit.dart';
import 'package:test_audio_player/logic/cubits/player/player_cubit.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    var appCubit = BlocProvider.of<AppCubit>(context);
    var playerCubit = BlocProvider.of<PlayerCubit>(context);
    return Container(
      child: BlocBuilder<PlayerCubit, PlayerState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.timeMusic.toStringAsPrecision(3) + "%"),
              Slider(
                value: state.timeMusic,
                min: 0,
                max: 100,
                divisions: 100,
                label: state.timeMusic.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    state.timeMusic = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      appCubit.previousMusic();
                      playerCubit.resetPlayer();
                    },
                    tooltip: 'forward',
                    child: Icon(Icons.fast_rewind),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'play',
                    child: Icon(Icons.play_arrow),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      appCubit.nextMusic();
                      playerCubit.resetPlayer();
                    },
                    tooltip: 'forward',
                    child: Icon(Icons.fast_forward),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
