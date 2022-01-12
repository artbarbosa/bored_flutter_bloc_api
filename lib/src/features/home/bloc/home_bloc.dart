import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/src/commons/repositories/repository.dart';
import 'package:flutter_bloc_api/src/commons/utils/connectivity_check.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepositoryImp _repository;
  final ConnectivityCheck _connectivityCheck;

  HomeBloc(this._repository, this._connectivityCheck)
      : super(HomeLoadingState()) {
    _connectivityCheck.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await _repository.getBoredActivity();
      emit(HomeLoadedState(
          activity.activity, activity.type, activity.participants));
    });

    on<NoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });
  }
}
