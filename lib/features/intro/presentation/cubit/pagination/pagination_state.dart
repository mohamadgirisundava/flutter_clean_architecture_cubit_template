// part of 'pagination_cubit.dart';

// enum PaginationStatus { initial, loading, loadingMore, error, done }

// class PaginationState extends Equatable {
//   final PaginationStatus status;
//   final String? message;
//   final bool hasReachedMax;
//   final List<NewTransactionData?>? list;
//   final int page, totalPages;

//   PaginationState({
//     this.status = PaginationStatus.initial,
//     this.hasReachedMax = false,
//     List<NewTransactionData?>? list,
//     this.message,
//     this.page = 0,
//     this.totalPages = 1,
//   }) : list = list ?? [];

//   PaginationState copyWith({
//     PaginationStatus? status,
//     String? message,
//     List<NewTransactionData?>? list,
//     bool? hasReachedMax,
//     int? page,
//     int? totalPages,
//   }) {
//     return PaginationState(
//       status: status ?? this.status,
//       list: list ?? this.list,
//       message: message ?? this.message,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//       page: page ?? this.page,
//       totalPages: totalPages ?? this.totalPages,
//     );
//   }

//   @override
//   List<Object?> get props => [status, page, totalPages];
// }
