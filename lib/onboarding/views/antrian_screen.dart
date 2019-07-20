import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xplore_mandiri/my_widget.dart';

import 'final_screen.dart';

class AntrianScreen extends StatefulWidget {
  @override
  _AntrianScreenState createState() => _AntrianScreenState();
}

class _AntrianScreenState extends State<AntrianScreen> {
  bool done = false;

  _wait() {
    Timer(Duration(seconds: 2), () async {
      setState(() {
        done = true;
      });
    });
  }

  @override
  void initState() {
    _wait();
    super.initState();
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                    width: 200.0,
                    height: 200.0,
                    padding: EdgeInsets.all(32.0),
                    child: !done
                        ? CircularProgressIndicator()
                        : Icon(
                            Icons.check,
                            size: 100.0,
                            color: Colors.green,
                          )),
                museoText("Anda sedang dalam antrian",
                    bold: FontWeight.bold, fontSize: 22.0),
                museoText("Hardap tunggu"),

                Container(height: 32.0,),
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
                          Navigator.push(
                              context, MaterialPageRoute(builder: (c) => FinalScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            museoText("Lanjutkan",
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
