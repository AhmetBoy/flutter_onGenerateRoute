import 'package:flutter/material.dart';
import 'package:mutlu_bayramlar4/constants.dart';

import 'user_data.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData kullanici_bilgileri =
        ModalRoute.of(context)!.settings.arguments as UserData;
    if (ModalRoute.of(context)!.settings.arguments as UserData != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("RESULT PAGE"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                '''
                   "BOY: ${kullanici_bilgileri.boy}
                    KİLO: ${kullanici_bilgileri.kilo}
                    SPOR: ${kullanici_bilgileri.yapilanSpor}
                    SİGARA: ${kullanici_bilgileri.icilenSigara}
                    CİNSİYET: ${kullanici_bilgileri.cinsiyet}"
                    ''',
                style: kMetinStili,
              )),
            ),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("GERİ DÖN", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    }
    throw ('widget is null');
  }
}

// if (widget != null) return widget;
// throw ('widget is null');
