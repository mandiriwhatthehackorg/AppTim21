import 'package:flutter/material.dart';

import '../my_widget.dart';

class MyLoading {
  void startLoading() {
  }
  void finishLoading(isSuccess, {message}) {
  }
}

class MyDialog {
  final BuildContext context;
  String title;
  String content;

  MyDialog(this.context, {title, content});

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
              padding: EdgeInsets.all(30.0),
              child: new CircularProgressIndicator())),
    );
  }

  void pop() {
    Navigator.pop(context);
  }

  void error(message,{title}) {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
          title: museoText(title??"Gagal", color: Colors.red),
          content: museoText(message ?? "Terjadi Kesalahan"),
          actions: <Widget>[
            FlatButton(
              child: museoText("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }

  void popUp(){

  }
}