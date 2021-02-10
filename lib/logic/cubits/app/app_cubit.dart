import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_audio_player/logic/cubits/app/app_cubit.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  List<String> listMusic = [
    'Billie Jean',
    'Smooth Criminal',
    'Beat it',
    'Thriller'
  ];
  AppCubit() : super(AppState(musicName: 'Billie Jean'));

  void nextMusic() =>
      emit(AppState(musicName: getNextMusic(listMusic, state.musicName)));

  String getNextMusic(List<String> listMusic, String musicName) {
    for (var i = 0; i < listMusic.length; i++) {
      if (listMusic[i] == musicName) {
        if (listMusic[i] == listMusic.last) {
          return listMusic.first;
        } else {
          return listMusic[i + 1];
        }
      }
    }
    return listMusic.first;
  }
}
