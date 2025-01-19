import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/helpers/layout_helper.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/images.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/elite_button_theme.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/font_style.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/shadow_style.dart';
import 'package:flutter_clean_architecture_cubit_template/core/widgets/elite_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

alertConfirm({
  required BuildContext context,
  required String message,
  required Function ok,
  required Function cancel,
}) {
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        color: Colors.black26,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: Align(
            child: InkWell(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: sizeFigma(context, 20),
                  vertical: sizeFigma(context, 30),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeFigma(context, 10),
                  horizontal: sizeFigma(context, 20),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      sizeFigma(context, 15),
                    ),
                  ),
                  boxShadow: defaultShadowTheme(context),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: sizeFigma(context, 20),
                      ),
                      Image.asset(
                        IMAGES.icAlertConfirm,
                        width: sizeFigma(context, 40),
                        height: sizeFigma(context, 40),
                      ),
                      SizedBox(
                        height: sizeFigma(context, 15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: sizeFigma(context, 20),
                        ),
                        child: AutoSizeText(
                          message,
                          textAlign: TextAlign.center,
                          style: EliteFontStyle.style(
                            context,
                            size: 14,
                            color: COLORS.black,
                            fontWeight: FONTWEIGHT.regular,
                          ),
                          minFontSize: 12,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: sizeFigma(context, 30),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: sizeFigma(context, 35),
                              width: double.infinity,
                              child: EliteButton(
                                theme: EliteButtonTheme(
                                  buttonColor: Colors.transparent,
                                  textStyle: EliteFontStyle.style(
                                    context,
                                    size: 14,
                                    color: COLORS.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onClick: () {
                                  cancel();
                                  Navigator.of(context).pop();
                                },
                                text: "TIDAK",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: sizeFigma(context, 10),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: sizeFigma(context, 35),
                              width: double.infinity,
                              child: EliteButton(
                                onClick: () {
                                  ok();
                                  Navigator.of(context).pop();
                                },
                                text: "YA",
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: sizeFigma(context, 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

alertError(
  BuildContext context, {
  String? message,
  Function? callBack,
}) {
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        color: Colors.black26,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: Align(
            child: InkWell(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: sizeFigma(context, 20),
                  vertical: sizeFigma(context, 30),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeFigma(context, 10),
                  horizontal: sizeFigma(context, 20),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      sizeFigma(context, 15),
                    ),
                  ),
                  boxShadow: defaultShadowTheme(context),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: sizeFigma(context, 20),
                      ),
                      Image.asset(
                        IMAGES.icAlertError,
                        width: sizeFigma(context, 40),
                        height: sizeFigma(context, 40),
                      ),
                      SizedBox(
                        height: sizeFigma(context, 15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: sizeFigma(context, 20),
                        ),
                        child: AutoSizeText(
                          message ?? 'Terjadi Kesalahan',
                          textAlign: TextAlign.center,
                          style: EliteFontStyle.style(
                            context,
                            size: 14,
                            color: COLORS.redError,
                            fontWeight: FONTWEIGHT.regular,
                          ),
                          minFontSize: 12,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: sizeFigma(context, 20),
                      ),
                      SizedBox(
                        height: sizeFigma(context, 35),
                        width: 100,
                        child: EliteButton(
                          onClick: () {
                            Navigator.of(context).pop();
                          },
                          text: "Ya",
                          theme: redButtonTheme(context),
                        ),
                      ),
                      SizedBox(
                        height: sizeFigma(context, 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(() => callBack != null ? callBack() : null);
}

alertSuccess(
  BuildContext context, {
  String? title,
  String? message,
  Function? callBack,
  bool barrierDismissible = true,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: barrierDismissible,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) {
            return;
          }
        },
        child: Material(
          color: Colors.black26,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              if (barrierDismissible) {
                Navigator.of(context).pop(true);
              }
            },
            child: Align(
              child: InkWell(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: sizeFigma(context, 20),
                    vertical: sizeFigma(context, 30),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: sizeFigma(context, 10),
                    horizontal: sizeFigma(context, 20),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        sizeFigma(context, 15),
                      ),
                    ),
                    boxShadow: defaultShadowTheme(context),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: sizeFigma(context, 20),
                        ),
                        Image.asset(
                          IMAGES.icAlertSuccess,
                          width: sizeFigma(context, 40),
                          height: sizeFigma(context, 40),
                        ),
                        SizedBox(
                          height: sizeFigma(context, 15),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: sizeFigma(context, 20),
                          ),
                          child: AutoSizeText(
                            title ?? 'SUKSES',
                            textAlign: TextAlign.center,
                            style: EliteFontStyle.style(
                              context,
                              size: 16,
                              color: COLORS.primary,
                              fontWeight: FONTWEIGHT.bold,
                            ),
                            minFontSize: 16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        message != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: sizeFigma(context, 5),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: sizeFigma(context, 20),
                                    ),
                                    child: AutoSizeText(
                                      message,
                                      textAlign: TextAlign.center,
                                      style: EliteFontStyle.style(
                                        context,
                                        size: 14,
                                        color: COLORS.primary,
                                        fontWeight: FONTWEIGHT.regular,
                                      ),
                                      minFontSize: 12,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizeFigma(context, 30),
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: sizeFigma(context, 20),
                              ),
                        SizedBox(
                          height: sizeFigma(context, sizeFigma(context, 35)),
                          width: sizeFigma(context, 100),
                          child: EliteButton(
                            onClick: () {
                              Navigator.of(context).pop();
                            },
                            text: 'YA',
                          ),
                        ),
                        SizedBox(
                          height: sizeFigma(context, 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(() => callBack != null ? callBack() : null);
}
