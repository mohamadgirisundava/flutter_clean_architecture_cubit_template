import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EliteTextField extends StatefulWidget {
  final String hintText;
  final bool isHidden, isMultiLine;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final EliteTextFieldTheme? theme;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;

  const EliteTextField({
    super.key,
    this.hintText = '',
    this.isHidden = false,
    this.isMultiLine = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textInputAction,
    this.controller,
    this.prefix,
    this.suffix,
    this.theme,
    this.inputFormatters,
    this.onSubmitted,
    this.textCapitalization,
  });

  @override
  EliteTextFieldState createState() => EliteTextFieldState();
}

class EliteTextFieldState extends State<EliteTextField> {
  bool isTextShown = false;

  @override
  void initState() {
    super.initState();
    if (widget.isHidden) {
      isTextShown = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final EliteTextFieldTheme effectiveTheme =
        widget.theme ?? defaultEliteTextFieldTheme(context);

    Widget? suffixIcon = widget.suffix;
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
      child: TextField(
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        style: effectiveTheme.textStyle,
        decoration: InputDecoration(
          isDense: true,
          filled: effectiveTheme.fillColor != null,
          fillColor: effectiveTheme.fillColor,
          border: effectiveTheme.border,
          focusedBorder: effectiveTheme.focusedBorder,
          errorBorder: effectiveTheme.errorBorder,
          disabledBorder: effectiveTheme.disabledBorder,
          focusedErrorBorder: effectiveTheme.focusedErrorBorder,
          enabledBorder: effectiveTheme.enabledBorder,
          hintText: widget.hintText,
          hintStyle: effectiveTheme.hintStyle,
          contentPadding: effectiveTheme.contentPadding,
          hintMaxLines: 1,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(maxHeight: 18),
          prefixIcon: widget.prefix != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: widget.prefix,
                )
              : null,
          prefixIconConstraints: const BoxConstraints(maxHeight: 18),
        ),
        obscureText: widget.isHidden
            ? isTextShown
            : false, // Tampilkan atau sembunyikan teks
        cursorColor: COLORS.primary,
        maxLines: widget.isMultiLine ? 4 : 1,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
