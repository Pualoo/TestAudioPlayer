import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerState(timeMusic: 0));

  void updateTime(double time) => emit(PlayerState(timeMusic: time));

  void resetPlayer() => emit(PlayerState(timeMusic: 0));
}
