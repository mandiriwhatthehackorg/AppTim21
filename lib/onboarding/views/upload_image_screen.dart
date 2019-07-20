import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../my_widget.dart';
import 'antrian_screen.dart';

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

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  imageSelector() async {
    var galleryFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("xxx" + galleryFile.path);
    setState(() {});
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
                  InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: _item(),
                  ),
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
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (c) => AntrianScreen()));
                          },
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.domain,
                                  size: 32.0,
                                ),
                                Container(
                                  height: 8.0,
                                ),
                                museoText("Validasi manual",
                                    bold: FontWeight.bold),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (c) => AntrianScreen()));
                          },
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.linked_camera,
                                  size: 32.0,
                                ),
                                Container(
                                  height: 8.0,
                                ),
                                museoText("Video call dengan petugas mandiri",
                                    bold: FontWeight.bold, align: TextAlign.center),
                              ],
                            ),
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
