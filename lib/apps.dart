import 'package:flutter_clean_architecture_cubit_template/core/constants/font.dart';
import 'package:flutter_clean_architecture_cubit_template/core/constants/router.dart';
import 'package:flutter_clean_architecture_cubit_template/features/intro/presentation/screens/intro_screen.dart';
import 'package:flutter_clean_architecture_cubit_template/init_main.dart';
import 'package:flutter_clean_architecture_cubit_template/injection_container.dart'
    as di;
import 'package:flutter/material.dart';

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  final _locale = const Locale('id', 'ID');

  @override
  void initState() {
    initDI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      navigatorKey: navigatorKey,
      routes: {
        ROUTER.intro: (context) => const IntroScreen(),
      },
      initialRoute: ROUTER.intro,
      theme: ThemeData(fontFamily: FONT.fontPoppins),
    );
  }
}

void initDI() async {
  await di.injectionInit();
}
