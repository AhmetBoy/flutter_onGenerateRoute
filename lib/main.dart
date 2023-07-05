import 'package:flutter/material.dart';
import 'package:mutlu_bayramlar4/result_page.dart';
import 'package:mutlu_bayramlar4/user_data.dart';

import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent),
      home: InputPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case InputPage.routName:
            return MaterialPageRoute(builder: (context) => InputPage());
          case ResultPage.routName:
            return MaterialPageRoute(
                builder: (context) => ResultPage(
                      kullanici_bilgileri: settings.arguments as UserData,
                    ));
        }
        return null;
      },
    );
  }
}
