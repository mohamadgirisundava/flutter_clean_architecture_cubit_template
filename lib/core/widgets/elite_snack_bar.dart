import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/font_style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../res/colors.dart';

class EliteSnackBar {
  void showEliteSnackBar({
    required BuildContext context,
    Color? backgroundColor,
    required String text,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AutoSizeText(
          text,
          style: EliteFontStyle.style(
            context,
            size: 14,
            color: COLORS.white,
            fontWeight: FONTWEIGHT.regular,
          ),
          maxFontSize: 14,
          minFontSize: 8,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: backgroundColor ?? COLORS.red,
      ),
    );
  }
}
