import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_cubit_template/core/helpers/layout_helper.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';

class EliteTextFieldTheme {
  final EdgeInsetsGeometry contentPadding;
  final TextStyle hintStyle, textStyle;
  final InputBorder border,
      focusedBorder,
      errorBorder,
      disabledBorder,
      focusedErrorBorder,
      enabledBorder;
  final Color? fillColor;

  const EliteTextFieldTheme({
    required this.contentPadding,
    required this.hintStyle,
    required this.textStyle,
    required this.border,
    required this.focusedBorder,
    required this.errorBorder,
    required this.disabledBorder,
    required this.focusedErrorBorder,
    required this.enabledBorder,
    this.fillColor,
  });
}

EliteTextFieldTheme defaultEliteTextFieldTheme(BuildContext context) {
  return EliteTextFieldTheme(
    contentPadding: EdgeInsets.only(
      left: sizeFigma(context, 16),
      top: sizeFigma(context, 14),
      bottom: sizeFigma(context, 14),
      right: sizeFigma(context, 16),
    ),
    hintStyle: EliteFontStyle.style(
      context,
      size: 12,
      color: COLORS.grey.withValues(alpha: 0.7),
      fontWeight: FONTWEIGHT.regular,
    ),
    textStyle: EliteFontStyle.style(
      context,
      size: 12,
      color: COLORS.primary,
      fontWeight: FONTWEIGHT.medium,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(sizeFigma(context, 12))),
      borderSide: BorderSide(
          color: COLORS.grey.withValues(alpha: 0.5),
          width: sizeFigma(context, 1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(sizeFigma(context, 12))),
      borderSide:
          BorderSide(color: COLORS.primary, width: sizeFigma(context, 1.5)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(sizeFigma(context, 12))),
      borderSide:
          BorderSide(color: Colors.redAccent, width: sizeFigma(context, 1.5)),
      gapPadding: 4,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(sizeFigma(context, 12))),
      borderSide: BorderSide(
          color: COLORS.grey.withValues(alpha: 0.3),
          width: sizeFigma(context, 1)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(sizeFigma(context, 12))),
      borderSide:
          BorderSide(color: Colors.redAccent, width: sizeFigma(context, 1.5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(sizeFigma(context, 12))),
      borderSide: BorderSide(
          color: COLORS.grey.withValues(alpha: 0.5),
          width: sizeFigma(context, 1)),
    ),
  );
}
