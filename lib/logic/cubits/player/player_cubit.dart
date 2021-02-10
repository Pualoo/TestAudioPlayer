import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerState(timeMusic: 0));

  void updateTime() => emit(PlayerState(timeMusic: null));
}
