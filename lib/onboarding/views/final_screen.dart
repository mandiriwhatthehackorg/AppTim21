import 'package:flutter/material.dart';
import 'package:xplore_mandiri/etb/etb_screen.dart';
import 'package:xplore_mandiri/navigationn/navigation_screen.dart';

import '../../my_widget.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafcff),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: museoText("Buka rekening baru"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(twilight),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  museoText("tabungan rupiah", color: Colors.white),
                  secondLogo(86.0, 30.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      child: museoText("4",
                          color: Colors.white,
                          bold: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    museoText(" dari 4", color: Colors.grey, fontSize: 20.0),
                  ],
                ),
                Container(
                  height: 32.0,
                ),
                museoText(
                    "Selamat, akun mandiri tabungan rupiah Anda telah dibuka.",
                    fontSize: 20.0,
                    color: Colors.blue[900],
                    bold: FontWeight.bold),
                Container(
                  height: 24.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(2.0),
                        ),
                        color: Colors.blue[900],
                        onPressed: () {

                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (c) => NavigationScreen(etb: true,)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            museoText("Lanjut",
                                color: Colors.white,
                                bold: FontWeight.bold,
                                fontSize: 18.0),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
