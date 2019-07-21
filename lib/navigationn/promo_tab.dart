import 'package:flutter/material.dart';

import '../my_widget.dart';

class PromoTab extends StatefulWidget {
  @override
  _PromoTabState createState() => _PromoTabState();
}

class _PromoTabState extends State<PromoTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:
      const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
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
              Container(height: 24.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  museoText("Promo",
                      color: Colors.blue[900],
                      fontSize: 20.0,
                      bold: FontWeight.bold),
                  Row(
                    children: <Widget>[
                      museoText("Lihat Semua",
                          color: Colors.blue[900]),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ],
              ),
              Image.asset("assets/images/etb_promo.png"),
            ],
          ),
        ),
      ),
    );
  }
}
