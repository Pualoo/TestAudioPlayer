import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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

  void previousMusic() =>
      emit(AppState(musicName: getPreviousMusic(listMusic, state.musicName)));

  void setMusic(String music) => emit(AppState(musicName: music));

  List<String> getListMusic() {
    return listMusic;
  }

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

  String getPreviousMusic(List<String> listMusic, String musicName) {
    for (var i = 0; i < listMusic.length; i++) {
      if (listMusic[i] == musicName) {
        if (listMusic[i] == listMusic.first) {
          return listMusic.last;
        } else {
          return listMusic[i - 1];
        }
      }
    }
    return listMusic.first;
  }
}
