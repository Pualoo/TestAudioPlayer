import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_audio_player/logic/Cubits/App/app_cubit.dart';
import 'package:test_audio_player/logic/cubits/player/player_cubit.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    var playerCubit = BlocProvider.of<PlayerCubit>(context);
    var appCubit = BlocProvider.of<AppCubit>(context);
    return Container(
      child: Column(
        children: [
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 60,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {},
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
                },
                tooltip: 'forward',
                child: Icon(Icons.fast_forward),
              ),
            ],
          )
        ],
      ),
    );
  }
}
