import 'package:flutter/material.dart';
import 'package:xplore_mandiri/navigationn/tabungan_screen.dart';

import '../my_widget.dart';

class EtbScreen extends StatefulWidget {
  @override
  _EtbScreenState createState() => _EtbScreenState();
}

class _EtbScreenState extends State<EtbScreen> {


  bool _ishide=true;
  _card(icon, title, {Color color}) {
    return Card(
      elevation: 1.0,
      child: Container(
        width: 98.0,
        height: 88.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: color == null ? Colors.blue[900] : color,
              ),
              Container(
                height: 8.0,
              ),
              museoText(title, align: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  _hide(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 16.0,),
        museoText(
          "bisnis",
          color: Colors.blue[900],
          fontSize: 20.0,
        ),

        Row(
          children: <Widget>[
            _card(Icons.credit_card, "Kartu Kredit"),
            _card(Icons.credit_card, "Kartu Debit"),
            _card(Icons.account_balance, "Tabungan"),
          ],
        ),
        Row(
          children: <Widget>[
            _card(Icons.credit_card, "Giro"),
            _card(Icons.access_time, "Deposito"),
          ],
        ),
      ],
    );
  }
  _mandiri(){
    return
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 16.0,
            ),
            Image.asset(
              "assets/images/mandiri_biru.png",
              width: 81.1,
              height: 24.0,
            ),
            Container(
              height: 16.0,
            ),
            museoText(
              "individu",
              color: Colors.blue[900],
              fontSize: 20.0,
            ),
            Row(
              children: <Widget>[
                _card(Icons.credit_card, "Kartu Kredit"),
                InkWell(
                  child: _card(Icons.account_balance, "Tabungan"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => TabunganScreen()));
                  },
                ),
                Card(
                  elevation: 1.0,
                  child: Container(
                    width: 98.0,
                    height: 88.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(2.0)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/icon_hand.png",
                            width: 31.0,
                            height: 27.0,
                          ),
                          Container(
                            height: 8.0,
                          ),
                          museoText("Pinjaman"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                _card(Icons.phonelink, "e-Banking"),
                _card(Icons.access_time, "Deposito"),
              ],
            ),

            _ishide?Container():_hide(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _ishide = !_ishide;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        museoText(_ishide?"Tampilkan lebih banyak":"Sembunyikan sebagian",
                            bold: FontWeight.bold,
                            color: Colors.blue[900]),
                        Icon(_ishide?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                mainLogo(73.0, 40.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_1,
                      color: Colors.amber,
                    ),
                    museoText(" 0 point "),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ],
            ),
            Container(
              height: 32.0,
            ),



            _mandiri(),

          ],
        ),
      ),
    );
  }
}
