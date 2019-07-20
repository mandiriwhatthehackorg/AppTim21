import 'package:flutter/material.dart';
import 'package:xplore_mandiri/navigationn/tabungan_screen.dart';
import 'package:xplore_mandiri/onboarding/views/onboarding_screen.dart';

import '../my_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _card(icon, title, {Color color}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
                color: color==null?Colors.blue[900]:color,
              ),
              museoText(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mainLogo(72.9, 40.0),
                      Container(
                        width: 97.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        child: Center(
                          child: museoText("Masuk",
                              color: Colors.white,
                              bold: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 24.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      museoText("Promo Mandiri",
                          color: Colors.blue[900],
                          fontSize: 20.0,
                          bold: FontWeight.bold),
                      Row(
                        children: <Widget>[
                          museoText("Lihat Semua", color: Colors.blue[900]),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 300.0,
                  child: dummyList(context),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  museoText("Populer",
                      color: Colors.blue[900],
                      fontSize: 20.0,
                      bold: FontWeight.bold),
                  Row(
                    children: <Widget>[
                      _card(Icons.credit_card, "Kartu Kredit"),
                      _card(Icons.credit_card, "Kartu Debit"),
                      InkWell(
                        child: _card(Icons.account_balance, "Tabungan"),
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (c) => TabunganScreen()));

                        },
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _card(Icons.credit_card, "Giro"),
                      _card(Icons.access_time, "Deposito"),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  museoText("Syariah",
                      color: Colors.blue[900],
                      fontSize: 20.0,
                      bold: FontWeight.bold),
                  Row(
                    children: <Widget>[
                      _card(Icons.credit_card, "Kartu Kredit", color: Colors.green),
                      _card(Icons.credit_card, "Kartu Debit", color: Colors.green),
                      _card(Icons.account_balance, "Tabungan", color: Colors.green),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _card(Icons.credit_card, "Giro", color: Colors.green),
                      _card(Icons.access_time, "Deposito", color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  museoText("Cicilan & Tabungan",
                      color: Colors.blue[900],
                      fontSize: 20.0,
                      bold: FontWeight.bold),
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
              ),
            ),

            Container(height: 32.0,),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: 192.0,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      museoText("nikmati semua",
                          color: Colors.white,
                          fontSize: 26.0,
                          bold: FontWeight.bold),
                      museoText("kemudahan dalam",
                          color: Colors.white,
                          fontSize: 26.0,
                          bold: FontWeight.bold),
                      museoText("satu genggaman.",
                          color: Colors.white,
                          fontSize: 26.0,
                          bold: FontWeight.bold),
                    ],
                  ),

                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (c) => OnBoardingScreen()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        museoText("Buka rekening sekarang",
                            color: Colors.blue[900], bold: FontWeight.bold),
                        Container(width: 50.0,),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue[900],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
