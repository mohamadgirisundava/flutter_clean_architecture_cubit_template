// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'pagination_state.dart';

// class PaginationCubit extends Cubit<PaginationState> {
//   final GetPagination _useCase;

//   PaginationCubit(this._useCase) : super(PaginationState());

//   void getPagination({bool isRefresh = false, String? status}) async {
//     if (isRefresh) {
//       emit(state.copyWith(page: 0, totalPages: 1, hasReachedMax: false));
//     }

//     if (!state.hasReachedMax) {
//       if (isRefresh) {
//         emit(state.copyWith(status: PaginationStatus.loading));
//       } else {
//         emit(state.copyWith(status: PaginationStatus.loadingMore));
//       }

//       var data = await _useCase.call(GetPaginationParams(
//         page: state.page + 1,
//         status: status,
//       ));

//       data.fold((l) {
//         if (isRefresh) {
//           emit(state.copyWith(
//             status: PaginationStatus.error,
//             message: l.error?.message,
//           ));
//         } else {
//           emit(state.copyWith(
//             status: PaginationStatus.done,
//             hasReachedMax: state.page == state.totalPages,
//           ));
//         }
//       }, (r) {
//         if (isRefresh) {
//           state.list?.clear();
//         }

//         var list = state.list ?? [];
//         list.addAll(r?.transaction?.data ?? []);

//         emit(state.copyWith(
//           totalPages: r?.transaction?.lastPage ?? 1,
//           list: list,
//           page: r?.transaction?.currentPage ?? 1,
//         ));

//         emit(state.copyWith(
//           status: PaginationStatus.done,
//           hasReachedMax: state.page == state.totalPages,
//         ));
//       });
//     }
//   }
// }
