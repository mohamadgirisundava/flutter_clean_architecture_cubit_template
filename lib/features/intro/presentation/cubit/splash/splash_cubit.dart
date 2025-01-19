import 'package:flutter_clean_architecture_cubit_template/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../user/domain/usecases/get_token_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetToken _useCase;

  SplashCubit(this._useCase) : super(const SplashState());

  void start(int duration) async {
    emit(state.copyWith(status: SplashStatus.loading));

    await Future.delayed(Duration(seconds: duration));

    var data = await _useCase.call(NoParams());
    data.fold(
      (l) => emit(state.copyWith(status: SplashStatus.error)),
      (r) => emit(state.copyWith(status: SplashStatus.done)),
    );
  }
}
