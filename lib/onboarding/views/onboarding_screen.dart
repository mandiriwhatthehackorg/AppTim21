import 'package:flutter/material.dart';

import '../../my_widget.dart';
import 'create_session_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: museoText("Buka rekening baru"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  museoText("Selamat datang di pembukaan",
                      color: Colors.blue[900], fontSize: 20.0),
                  Row(
                    children: <Widget>[
                      museoText("rekening ",
                          color: Colors.blue[900], fontSize: 20.0),
                      museoText(" mandiri",
                          bold: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 20.0),
                      museoText(" tabungan rupiah.",
                          color: Colors.blue[900], fontSize: 20.0)
                    ],
                  ),
                  Container(
                    height: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      museoText("Untuk membuka rekening ",
                          color: Colors.blue[900]),
                      museoText("mandiri",
                          bold: FontWeight.bold, color: Colors.blue[900]),
                      museoText(" tabungan", color: Colors.blue[900])
                    ],
                  ),
                  museoText("rupiah, ikuti langkah-langkah berikut.",
                      color: Colors.blue[900]),
                  Container(
                    height: 16.0,
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (c) => CreateSessionScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[900],
                                      child: museoText("1",
                                          color: Colors.white,
                                          bold: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    Container(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          museoText(
                                              "Buat akun aplikasi mandiri online",
                                              fontSize: 18.0),
                                          museoText(
                                              "Dengan mandiri online, Anda dapat bertransaksi dimana saja."),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    museoText("Mulai", color: Colors.blue[900]),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.blue[900],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: museoText("2",
                                        color: Colors.white,
                                        bold: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  Container(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        museoText(
                                            "Pilih kartu debit mandiri",
                                            fontSize: 18.0),
                                        museoText(
                                            "Mudah untuk melakukan pembayaran di banyak mitra."),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  museoText("Mulai", color: Colors.blue[900]),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue[900],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: museoText("3",
                                        color: Colors.white,
                                        bold: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  Container(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        museoText(
                                            "Validasi identitas",
                                            fontSize: 18.0),
                                        museoText(
                                            "Memastikan keaslian identitas yang Anda kirim."),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  museoText("Mulai", color: Colors.blue[900]),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue[900],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: museoText("4",
                                        color: Colors.white,
                                        bold: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  Container(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        museoText(
                                            "Selesai",
                                            fontSize: 18.0),
                                        museoText(
                                            "Anda sudah bisa menggunakan akun tabungan rupiah mandiri sekarang juga."),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  museoText("Mulai", color: Colors.blue[900]),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue[900],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
