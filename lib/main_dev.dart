import 'package:flutter_clean_architecture_cubit_template/apps.dart';
import 'package:flutter_clean_architecture_cubit_template/core/constants/network.dart';
import 'package:flutter_clean_architecture_cubit_template/core/flavors/flavor_config.dart';
import 'package:flutter_clean_architecture_cubit_template/init_main.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  FlavorConfig(
    flavor: Flavor.dev,
    flavorValues: FlavorValues(
      baseUrl: NETWORK.devUrl,
    ),
  );
  runApp(const Apps());
}
