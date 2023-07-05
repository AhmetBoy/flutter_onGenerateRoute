import 'package:flutter/material.dart';

import 'constants.dart';

class MyRotateWidget extends StatelessWidget {
  final String? boyKiloString;
  final int? boyKiloInt;
  final bool? boyOrKilo;
  final List<Widget> children;
  MyRotateWidget(
      {this.boyKiloString,
      this.boyKiloInt,
      this.boyOrKilo,
      required this.children});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Text(
                boyKiloString.toString(),
                style: kMetinStili,
              ),
            ),
            RotatedBox(
              quarterTurns: -1,
              child: Text(
                boyKiloInt.toString(),
                style: kSayiStili,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        )
      ],
    );
  }
}
