import 'package:flutter/material.dart';
import 'package:mutlu_bayramlar4/constants.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData? icon;
  final String? cinsiyet;
  IconCinsiyet({this.icon, this.cinsiyet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40),
        Text(
          "$cinsiyet",
          style: kMetinStili,
        )
      ],
    );
  }
}
