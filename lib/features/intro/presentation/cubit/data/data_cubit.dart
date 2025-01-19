// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'data_state.dart';

// class DataCubit extends Cubit<DataState> {
//   final GetData _useCase;

//   DataCubit(this._useCase) : super(const DataState());

//   void Data() async {
//     emit(state.copyWith(status: DataStatus.loading));
//     var res = await _useCase.call(DataParams());
//     res.fold(
//       (l) => emit(
//         state.copyWith(
//           status: DataStatus.error,
//           data: null,
//           message: l.error!.message,
//         ),
//       ),
//       (r) => emit(
//         state.copyWith(
//           status: DataStatus.done,
//           data: r,
//         ),
//       ),
//     );
//   }
// }
