import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/widgets/tapped_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/layout_helper.dart';
import '../res/colors.dart';
import '../styles/font_style.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.onBack,
    this.canBack = true,
    this.actions,
    this.height,
    this.backgroundColor,
  });

  final String? title;
  final Function()? onBack;
  final bool canBack;
  final List<Widget>? actions;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor ?? COLORS.primary,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: sizeFigma(context, 5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (canBack) ...[
                    SizedBox(width: sizeFigma(context, 12)),
                    TappedWidget(
                      borderRadius: BorderRadius.circular(4),
                      onTap: onBack ??
                          () {
                            Navigator.of(context).pop();
                          },
                      child: Icon(
                        Icons.chevron_left_rounded,
                        color: COLORS.white,
                        size: sizeFigma(context, 25),
                      ),
                    ),
                  ],
                  canBack == true
                      ? SizedBox(
                          width: sizeFigma(context, 5),
                        )
                      : SizedBox(
                          width: sizeFigma(context, 20),
                        ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          title ?? '',
                          style: EliteFontStyle.style(
                            context,
                            fontWeight: FONTWEIGHT.medium,
                            size: 20,
                            color: COLORS.white,
                          ),
                          maxFontSize: 20,
                          minFontSize: 8,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions ?? [],
                  ),
                  SizedBox(
                    width: sizeFigma(context, 12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
