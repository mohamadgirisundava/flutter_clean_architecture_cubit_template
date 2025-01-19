import 'package:flutter_clean_architecture_cubit_template/core/helpers/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';

List<BoxShadow> defaultShadowTheme(BuildContext context) {
  return [
    BoxShadow(
      color: COLORS.black.withValues(alpha: 0.2),
      spreadRadius: sizeFigma(context, 3),
      blurRadius: sizeFigma(context, 10),
      offset: Offset(
        sizeFigma(context, 2),
        sizeFigma(context, 5),
      ),
    ),
  ];
}
