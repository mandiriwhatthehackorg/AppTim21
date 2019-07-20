import 'package:flutter/material.dart';

import '../my_widget.dart';

class TabunganRupiahTab extends StatefulWidget {
  @override
  _TabunganRupiahTabState createState() => _TabunganRupiahTabState();
}

class _TabunganRupiahTabState extends State<TabunganRupiahTab> {
  _item(title, body) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              museoText(title, fontSize: 20.0, bold: FontWeight.bold),
              museoText(body, fontSize: 14.0, overflow: TextOverflow.fade)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset("assets/images/buku_tabungan.png"),
                    ),
                  ],
                ),
                Container(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    museoText("Fitur & Benefit",
                        color: Colors.orange,
                        fontSize: 18,
                        bold: FontWeight.bold),
                    museoText("Unduh petunjuk & layanan", bold: FontWeight.bold)
                  ],
                ),
                Container(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/fiesta_poin.png",
                      width: 64.0,
                    ),
                    Expanded(
                      child:
                      _item("4x Fiesta Poin",
                          "Quadruple fiestapoin setiap transaksi Rp. 20.000,- berlaku kelipatan."),
                    ),
                  ],
                ),
                Container(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/tabungan_coin.png",
                      width: 64.0,
                    ),
                    Expanded(
                      child: _item(
                          "Gratis Airport Lounge & Internet di Seluruh Dunia ",
                          "Quadruple fiestapoin setiap transaksi Rp. 20.000,- berlaku kelipatan."),
                    ),
                  ],
                ),
                Container(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/tabungan_coin.png",
                      width: 64.0,
                    ),
                    Expanded(
                      child: _item("Mandiri World Elite Concierge Service",
                          "Akses tanpa batas ke layanan Mandiri World Elite Concierge. Dapat diakses melalui Mandiri World Elite Concierge di nomor 021-52997760."),
                    ),
                  ],
                ),
              ],
            ),
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
                    museoText("dapatkan beragam",
                        color: Colors.white,
                        fontSize: 26.0,
                        bold: FontWeight.bold),
                    museoText("kemudahan fasilitas dan",
                        color: Colors.white,
                        fontSize: 26.0,
                        bold: FontWeight.bold),
                    museoText("transaksi mandiri",
                        color: Colors.white,
                        fontSize: 26.0,
                        bold: FontWeight.bold),
                  ],
                ),
                RaisedButton(
                  onPressed: () {},
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
      ),
    );
  }
}
