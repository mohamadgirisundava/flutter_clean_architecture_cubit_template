import 'package:flutter_clean_architecture_cubit_template/core/widgets/tapped_widget.dart';
import 'package:flutter/material.dart';

import '../helpers/layout_helper.dart';
import '../styles/elite_button_theme.dart';

class EliteButton extends StatelessWidget {
  final double width;
  final double height;
  final GestureTapCallback onClick;
  final String text;
  final EliteButtonTheme? theme;
  final Widget? leading;
  final double? leadingSpacing;
  final Widget? suffix;

  const EliteButton({
    super.key,
    this.width = double.infinity,
    this.theme,
    this.height = 40,
    required this.onClick,
    required this.text,
    this.leading,
    this.suffix,
    this.leadingSpacing,
  });

  @override
  Widget build(BuildContext context) {
    EliteButtonTheme temp = theme ?? defaultButtonTheme(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: temp.gradient,
        borderRadius: temp.radius,
        border: Border.all(
          width: temp.borderWidth,
          color: temp.borderColor,
        ),
        color: temp.buttonColor,
        boxShadow: temp.boxShadow,
      ),
      child: ClipRRect(
        borderRadius: temp.radius,
        child: TappedWidget(
          onTap: onClick,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: leading != null,
                child: Container(
                  margin: EdgeInsets.only(
                    right: leadingSpacing ?? sizeFigma(context, 11),
                  ),
                  child: leading,
                ),
              ),
              Text(text, style: temp.textStyle),
              Visibility(
                visible: suffix != null,
                child: Container(
                  child: suffix,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
