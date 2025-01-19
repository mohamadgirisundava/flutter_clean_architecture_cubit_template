import 'package:flutter_clean_architecture_cubit_template/core/helpers/layout_helper.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/text_field_style.dart';
import 'package:flutter/material.dart';

class EliteTextFormField extends StatefulWidget {
  final String hintText;
  final bool isHidden, isMultiLine, enabled;
  final TextInputType keyboardType;
  final Function(String? value)? onSaved;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final EliteTextFieldTheme? theme;
  final TextAlign textAlign;
  final TextCapitalization? textCapitalization;

  const EliteTextFormField({
    super.key,
    this.hintText = '',
    this.isHidden = false,
    this.isMultiLine = false,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.controller,
    this.enabled = true,
    this.prefix,
    this.suffix,
    this.theme,
    this.textAlign = TextAlign.start,
    this.textCapitalization,
  });

  @override
  State<EliteTextFormField> createState() {
    return _EliteTextFormFieldState();
  }
}

class _EliteTextFormFieldState extends State<EliteTextFormField> {
  bool isTextShown = false;
  Widget? suffixIcon;

  @override
  void initState() {
    super.initState();
    suffixIcon = widget.suffix;

    if (widget.isHidden) {
      isTextShown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    EliteTextFieldTheme? theme =
        widget.theme ?? defaultEliteTextFieldTheme(context);

    if (widget.isHidden) {
      suffixIcon = GestureDetector(
        onTap: () {
          setState(() {
            isTextShown = !isTextShown;
          });
        },
        child: Icon(
          isTextShown ? Icons.visibility_off : Icons.visibility,
          color: COLORS.grey,
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        style: theme.textStyle,
        textAlign: widget.textAlign,
        decoration: InputDecoration(
          isDense: true,
          filled: theme.fillColor != null,
          fillColor: theme.fillColor,
          border: theme.border,
          focusedBorder: theme.focusedBorder,
          errorBorder: theme.errorBorder,
          disabledBorder: theme.disabledBorder,
          focusedErrorBorder: theme.focusedErrorBorder,
          enabledBorder: theme.enabledBorder,
          hintText: widget.hintText,
          hintStyle: theme.hintStyle,
          contentPadding: theme.contentPadding,
          hintMaxLines: 1,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: sizeFigma(context, 15)),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints:
              BoxConstraints(maxHeight: sizeFigma(context, 18)),
          prefixIcon: widget.prefix != null
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: sizeFigma(context, 10)),
                  child: widget.prefix,
                )
              : null,
          prefixIconConstraints:
              BoxConstraints(maxHeight: sizeFigma(context, 18)),
        ),
        obscureText: widget.isHidden ? !isTextShown : false,
        cursorColor: COLORS.primary,
        maxLines: widget.isMultiLine ? 4 : 1,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        controller: widget.controller,
        enabled: widget.enabled,
      ),
    );
  }
}
