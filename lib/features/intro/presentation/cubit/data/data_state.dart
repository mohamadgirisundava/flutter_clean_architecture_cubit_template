// part of 'data_cubit.dart';

// enum DataStatus {
//   initial,
//   loading,
//   error,
//   done,
// }

// class DataState extends Equatable {
//   final DataStatus status;
//   final String? message;
//   final DataModel? data;

//   const DataState({
//     this.status = DataStatus.initial,
//     this.data,
//     this.message,
//   });

//   DataState copyWith({
//     DataStatus? status,
//     String? message,
//     DataModel? data,
//   }) {
//     return DataState(
//       status: status ?? this.status,
//       data: data ?? this.data,
//       message: message ?? this.message,
//     );
//   }

//   @override
//   List<Object?> get props => [status];
// }
