import 'package:flutter_clean_architecture_cubit_template/core/constants/font.dart';
import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/helpers/layout_helper.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';
import 'package:flutter/material.dart';

class EliteFontStyle {
  static TextStyle style(
    BuildContext context, {
    double size = 14,
    Color color = COLORS.black,
    FontWeight fontWeight = FONTWEIGHT.regular,
    TextDecoration decoration = TextDecoration.none,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: sizeFigma(context, size),
      decoration: decoration,
      fontFamily: fontFamily ?? FONT.fontPoppins,
    );
  }
}
