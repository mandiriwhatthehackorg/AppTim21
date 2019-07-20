import 'package:flutter/material.dart';

import '../../my_widget.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  _item() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 100.0,
            color: Colors.black12,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.landscape), Text("  Unggah Foto")],
            ),
          ),
        ),
      ],
    );
  }

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
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue[900],
                        child: museoText("3",
                            color: Colors.white,
                            bold: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      museoText(" dari 4", color: Colors.grey, fontSize: 20.0),
                    ],
                  ),
                  Container(
                    height: 8.0,
                  ),
                  museoText("Validasi identitas.", fontSize: 20.0),
                  Container(
                    height: 16.0,
                  ),
                  museoText("Foto KTP", fontSize: 20.0),
                  _item(),
                  Container(
                    height: 16.0,
                  ),
                  museoText("Selfie dengan KTP", fontSize: 20.0),
                  _item(),
                  Container(
                    height: 16.0,
                  ),
                  museoText("Foto Tanda Tangan", fontSize: 20.0),
                  _item(),
                  Container(
                    height: 16.0,
                  ),
                  museoText("Pilih cara validasi", fontSize: 20.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.domain,
                              size: 62.0,
                            ),
                            museoText("Datang ke cabang terdekat",
                                bold: FontWeight.bold),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.linked_camera,
                              size: 62.0,
                            ),
                            museoText("Video call", bold: FontWeight.bold),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(height: 16.0,),
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
//                  if (!_formKey.currentState.validate()) {
//                    print("FAILED");
//                    return;
//                  }
//                  _formKey.currentState.save();
//                  print(data);
                            //postLogin(data, this);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => UploadImageScreen()));
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
      ),
    );
  }
}
