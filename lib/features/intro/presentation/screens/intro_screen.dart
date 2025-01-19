import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_clean_architecture_cubit_template/core/constants/fontweight.dart';
import 'package:flutter_clean_architecture_cubit_template/core/res/colors.dart';
import 'package:flutter_clean_architecture_cubit_template/core/styles/font_style.dart';
import 'package:flutter_clean_architecture_cubit_template/core/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntroScreenImpl();
  }
}

class IntroScreenImpl extends StatefulWidget {
  const IntroScreenImpl({super.key});

  @override
  State<IntroScreenImpl> createState() => _IntroScreenImplState();
}

class _IntroScreenImplState extends State<IntroScreenImpl> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Flutter Clean Architecture Cubit Template',
        canBack: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              'You have pushed the button this many times:',
              style: EliteFontStyle.style(
                context,
                size: 14,
                fontWeight: FONTWEIGHT.regular,
                color: COLORS.black,
              ),
              textAlign: TextAlign.center,
              minFontSize: 14,
              maxLines: 100,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              '$_counter',
              style: EliteFontStyle.style(
                context,
                size: 24,
                fontWeight: FONTWEIGHT.regular,
                color: COLORS.black,
              ),
              textAlign: TextAlign.center,
              minFontSize: 14,
              maxLines: 100,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: COLORS.primary,
        child: const Icon(
          Icons.add,
          color: COLORS.white,
        ),
      ), //
    );
  }
}
