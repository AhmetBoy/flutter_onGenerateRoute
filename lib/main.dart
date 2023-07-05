import 'package:flutter/material.dart';
import 'package:mutlu_bayramlar4/result_page.dart';

import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/routeResultPage': (context) => ResultPage(),
      },
    );
  }
}
