import 'package:flutter/material.dart';
import 'package:xplore_mandiri/navigationn/tabungan_screen.dart';
import 'package:xplore_mandiri/onboarding/views/onboarding_screen.dart';

import '../my_widget.dart';

class HomeScreen extends StatefulWidget {
  bool etb;

  HomeScreen({this.etb = false});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _ishide = true;

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

  _hide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 16.0,
        ),
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

  _mandiri() {
    return Container(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => TabunganScreen()));
                },
              ),
              Card(
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
          _ishide ? Container() : _hide(),
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
                      museoText(
                          _ishide
                              ? "Tampilkan lebih banyak"
                              : "Sembunyikan sebagian",
                          bold: FontWeight.bold,
                          color: Colors.blue[900]),
                      Icon(_ishide
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up),
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

  _syariah() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 16.0,
          ),
          Image.asset(
            "assets/images/mandiri_syariah.png",
            width: 76.0,
            height: 40.0,
          ),
          Container(
            height: 16.0,
          ),
          museoText(
            "consumer",
            color: Colors.blue[900],
            fontSize: 20.0,
          ),
          Row(
            children: <Widget>[
              _card(Icons.account_balance, "Tabungan", color: Colors.green),
              _card(Icons.credit_card, "Giro", color: Colors.green),
              _card(Icons.access_time, "Deposito", color: Colors.green),
            ],
          ),
          Row(
            children: <Widget>[
              _card(Icons.stars, "Prioritas", color: Colors.green),
              _card(Icons.monetization_on, "Pembiayaan", color: Colors.green),
              _card(Icons.show_chart, "Investasi", color: Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    museoText("Tampilkan lebih banyak",
                        bold: FontWeight.bold, color: Colors.green),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _investasi() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 16.0,
          ),
          Image.asset(
            "assets/images/mandiri_investasi.png",
            width: 85.0,
            height: 40.0,
          ),
          Row(
            children: <Widget>[
              _card(Icons.credit_card, "Equity Fund"),
              _card(Icons.credit_card, "Balanced Fund"),
              _card(Icons.account_balance, "Fixed Income Fund"),
            ],
          ),
          Row(
            children: <Widget>[
              _card(Icons.credit_card, "Money Market Fund"),
              _card(Icons.access_time, "Protected Fund"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    museoText("Tampilkan lebih banyak",
                        bold: FontWeight.bold, color: Colors.blue[900]),
                    Icon(Icons.keyboard_arrow_down),
                  ],
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
      backgroundColor: Color(0xfffafcff),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  !widget.etb
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            mainLogo(72.9, 40.0),
                            Container(
                              width: 97.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                              ),
                              child: Center(
                                child: museoText("Masuk",
                                    color: Colors.white,
                                    bold: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                            ),
                          ],
                        )
                      : Row(
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
                    height: 24.0,
                  ),
                  !widget.etb
                      ? Row(
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
                        )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/gold.png",
                              width: 150.0,
                              height: 91.0,
                            ),
                            Container(height: 16.0,),
                            museoText("Claudio Suharno", bold: FontWeight.bold),
                            museoText("123456781", color: Colors.grey),
                          ],
                        ),
                ],
              ),
            ),
            
            !widget.etb?Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/promo1.png",
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              height: 13.0,
                            ),
                            museoText("mudah beli rumah",
                                fontSize: 20.0,
                                color: Colors.blue[900],
                                bold: FontWeight.bold),
                            museoText(
                              "dengan mandiri kpr milenial",
                              fontSize: 18.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/promo2.png",
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              height: 13.0,
                            ),
                            museoText("bisnis makin cuan",
                                fontSize: 20.0,
                                color: Colors.blue[900],
                                bold: FontWeight.bold),
                            museoText(
                              "dengan mandiri tabungan bisnis",
                              fontSize: 18.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 350.0,
                        height: 300.0,
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(height: 40.0),
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 250.0,
                                  color: Colors.blue[900],
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          museoText("nikmati semua",
                                              color: Colors.white,
                                              fontSize: 26.0,
                                              bold: FontWeight.bold),
                                          museoText("kemudahan dalam",
                                              color: Colors.white,
                                              fontSize: 26.0,
                                              bold: FontWeight.bold),
                                          museoText("satu genggaman",
                                              color: Colors.white,
                                              fontSize: 26.0,
                                              bold: FontWeight.bold),
                                        ],
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (c) =>
                                                      OnBoardingScreen()));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            museoText("Buka rekening sekarang",
                                                color: Colors.blue[900],
                                                bold: FontWeight.bold),
                                            Container(
                                              width: 50.0,
                                            ),
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
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: Image.asset(
                                "assets/images/hand.png",
                                width: 119.0,
                                height: 141.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _mandiri(),
                Container(
                  height: 16.0,
                ),
                _syariah(),
                Container(
                  height: 16.0,
                ),
                _investasi(),
                Container(
                  height: 32.0,
                ),
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
                              context,
                              MaterialPageRoute(
                                  builder: (c) => OnBoardingScreen()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            museoText("Buka rekening sekarang",
                                color: Colors.blue[900], bold: FontWeight.bold),
                            Container(
                              width: 50.0,
                            ),
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
            ):Image.asset("assets/images/etb_content.png",),
            
          ],
        ),
      ),
    );
  }
}
