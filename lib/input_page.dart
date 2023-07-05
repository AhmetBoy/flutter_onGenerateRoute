import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutlu_bayramlar4/constants.dart';
import 'package:mutlu_bayramlar4/result_page.dart';
import 'package:mutlu_bayramlar4/user_data.dart';

import 'icon_button.dart';
import 'my_container.dart';
import 'my_rotate_widget.dart';

class InputPage extends StatefulWidget {
  static const routName = '/routeInputPage';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool cinsiyet = false;
  double icilenSigara = 0;
  int yapilanSpor = 0;
  int boy = 170;
  int kilo = 90;
  String? boyOrKilo;

  void onPressPlusMinus(boyOrKilo) {
    setState(() {
      boyOrKilo == "boyArttir"
          ? boy++
          : boyOrKilo == "boyAzalt"
              ? boy--
              : boyOrKilo == "kiloArttir"
                  ? kilo++
                  : boyOrKilo == "kiloAzalt"
                      ? kilo--
                      : kilo--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: MyContainer(
                      child: MyRotateWidget(
                        boyKiloString: "BOY",
                        boyKiloInt: boy,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                onPressPlusMinus("boyArttir");
                              },
                              child: Icon(FontAwesomeIcons.plus)),
                          OutlinedButton(
                            onPressed: () {
                              onPressPlusMinus("boyAzalt");
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: MyRotateWidget(
                        boyKiloString: "KİLO",
                        boyKiloInt: kilo,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              onPressPlusMinus("kiloArttir");
                            },
                            child: Icon(
                              FontAwesomeIcons.plus,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              onPressPlusMinus("kiloAzalt");
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: MyContainer(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("data", style: kMetinStili),
                    Text(yapilanSpor.round().toString(), style: kSayiStili),
                    Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: yapilanSpor.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          yapilanSpor = value.toInt();
                        });
                      },
                    )
                  ],
                )),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(children: [
                  Expanded(
                    child: MyContainer(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("data", style: kMetinStili),
                        Text(icilenSigara.round().toString(),
                            style: kSayiStili),
                        Slider(
                          min: 0,
                          max: 30,
                          value: icilenSigara,
                          onChanged: (value) {
                            setState(() {
                              icilenSigara = value;
                            });
                          },
                        )
                      ],
                    )),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: MyContainer(
                      renk: cinsiyet == true ? Colors.deepPurple : Colors.white,
                      onPress: () {
                        setState(() {
                          cinsiyet = true;
                        });
                      },
                      child: IconCinsiyet(
                          icon: FontAwesomeIcons.venus, cinsiyet: "KADIN"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      renk:
                          cinsiyet == false ? Colors.deepPurple : Colors.white,
                      onPress: () {
                        setState(() {
                          cinsiyet = false;
                        });
                      },
                      child: IconCinsiyet(
                          icon: FontAwesomeIcons.mercury, cinsiyet: "ERKEK"),
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
                flex: 1,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromWidth(double.maxFinite),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {
                      Navigator.pushNamed(context, ResultPage.routName,
                          arguments: UserData(
                              boy: boy,
                              kilo: kilo,
                              yapilanSpor: yapilanSpor,
                              icilenSigara: icilenSigara,
                              cinsiyet: cinsiyet));
                    },
                    child: Text(
                      "HESAPLA",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ));
  }
}
