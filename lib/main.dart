import 'package:flutter/material.dart';
import 'package:riverpod_learn_masud/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/00_home/views/my_home_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod Demo',
      navigatorKey: NavigationService.key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
