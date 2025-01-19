// import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture_cubit_template/core/helpers/layout_helper.dart';
// import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';
// import 'package:flutter_clean_architecture_cubit_template/core/widgets/default_app_bar.dart';

// class PaginationListScreen extends StatelessWidget {
//   const PaginationListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const PaginationListScreenImpl();
//   }
// }

// class PaginationListScreenImpl extends StatefulWidget {
//   const PaginationListScreenImpl({super.key});

//   @override
//   State<PaginationListScreenImpl> createState() =>
//       _PaginationListScreenImplState();
// }

// class _PaginationListScreenImplState extends State<PaginationListScreenImpl> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset >=
//               _scrollController.position.maxScrollExtent &&
//           !_scrollController.position.outOfRange) {
//         context.read<PaginationCubit>().getPagination();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const DefaultAppBar(title: 'Pagination'),
//       body: BlocBuilder<PaginationCubit, PaginationState>(
//         builder: (context, pagination) {
//           if (pagination.status == PaginationStatus.done ||
//               pagination.status == PaginationStatus.loadingMore) {
//             return ListView.builder(
//               controller: _scrollController,
//               itemBuilder: (context, index) {
//                 if (index >= (pagination.list?.length ?? 0)) {
//                   return Center(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(
//                         vertical: sizeFigma(context, 10),
//                       ),
//                       width: sizeFigma(context, 40),
//                       height: sizeFigma(context, 40),
//                       child: CircularProgressIndicator(
//                         color: COLORS.primary,
//                         strokeWidth: sizeFigma(context, 5),
//                       ),
//                     ),
//                   );
//                 }

//                 return Container();
//               },
//               itemCount: pagination.hasReachedMax
//                   ? (pagination.list?.length ?? 0)
//                   : ((pagination.list?.length ?? 0) + 1),
//             );
//           } else {
//             return const SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
