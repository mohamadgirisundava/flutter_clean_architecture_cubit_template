import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/font_style.dart';
import 'package:flutter/material.dart';

import '../helpers/layout_helper.dart';
import '../res/colors.dart';

class EliteButtonTheme {
  final Gradient? gradient;
  final BorderRadius radius;
  final TextStyle textStyle;
  final double borderWidth;
  final Color borderColor;
  final Color buttonColor;
  final List<BoxShadow>? boxShadow;

  const EliteButtonTheme({
    this.gradient,
    this.radius = const BorderRadius.all(Radius.circular(15)),
    this.textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.buttonColor = Colors.white,
    this.boxShadow,
  });
}

defaultButtonTheme(BuildContext context) {
  return EliteButtonTheme(
    textStyle: EliteFontStyle.style(
      context,
      color: COLORS.white,
      fontWeight: FONTWEIGHT.semiBold,
    ),
    radius: BorderRadius.all(
      Radius.circular(sizeFigma(context, 8)),
    ),
    borderWidth: 0,
    buttonColor: COLORS.primary,
  );
}

redButtonTheme(BuildContext context) {
  return EliteButtonTheme(
    textStyle: EliteFontStyle.style(
      context,
      color: COLORS.white,
      fontWeight: FONTWEIGHT.semiBold,
    ),
    radius: BorderRadius.all(
      Radius.circular(sizeFigma(context, 8)),
    ),
    borderWidth: 0,
    buttonColor: COLORS.redError,
  );
}
