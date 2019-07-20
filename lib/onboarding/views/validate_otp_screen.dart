import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xplore_mandiri/my_widget.dart';
import 'package:xplore_mandiri/onboarding/models/otp_detail.dart';
import 'package:xplore_mandiri/onboarding/models/otp_response.dart';
import 'package:xplore_mandiri/onboarding/views/pick_plan_screen.dart';
import 'package:xplore_mandiri/utils/loading.dart';

import '../onboarding_presenter.dart';

class ValidateOtpScreen extends StatefulWidget {
  @override
  _ValidateOtpScreenState createState() => _ValidateOtpScreenState();
}

class _ValidateOtpScreenState extends State<ValidateOtpScreen>
    implements MyLoading {

  Map<String, dynamic> data = {};

  final FocusNode _one = FocusNode();
  final FocusNode _two = FocusNode();
  final FocusNode _three = FocusNode();
  final FocusNode _four = FocusNode();
  final FocusNode _five = FocusNode();
  final FocusNode _six = FocusNode();

  var _oneController = TextEditingController();
  var _twoController = TextEditingController();
  var _threeController = TextEditingController();
  var _fourController = TextEditingController();
  var _fiveController = TextEditingController();
  var _sixController = TextEditingController();
  bool isNull = true;

  var response;

  _postOtp() async {
    try {
      response = await postValidateOtp(jsonEncode(data), this);
      setState(() {
      });
    } catch (e) {
      print(e);
    }
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
        title: museoText("Masukkan kode verifikasi"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            museoText("Untuk validasi perangkat, masukkan kode verifikasi yang telah dikirimkan ke cla****@****.com", fontSize: 24.0),

            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: TextField(
                      controller: _oneController,
                      onTap: () {
                        _oneController.text = "";
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      onChanged: (term) {
                        fieldFocusChange(context, _one, _two);
                      },
                      focusNode: _one,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0),
                      //validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      //onSaved: (v) => data["name"] = v,
                    ),
                    width: 30.0,
                  ),
                  myRPadding(),
                  Container(
                    child: TextField(
                      controller: _twoController,
                      onTap: () {
                        _twoController.text = "";
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      onChanged: (term) {
                        fieldFocusChange(context, _two, _three);
                      },
                      focusNode: _two,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0),
                      //validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      //onSaved: (v) => data["name"] = v,
                    ),
                    width: 30.0,
                  ),
                  myRPadding(),
                  Container(
                    child: TextField(
                      controller: _threeController,
                      onTap: () {
                        _threeController.text = "";
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      onChanged: (term) {
                        fieldFocusChange(context, _three, _four);
                      },
                      focusNode: _three,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0),
                      //validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      //onSaved: (v) => data["name"] = v,
                    ),
                    width: 30.0,
                  ),
                  myRPadding(),
                  Container(
                    child: TextField(
                      controller: _fourController,
                      onTap: () {
                        _fourController.text = "";
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      onChanged: (term) {
                        fieldFocusChange(context, _four, _five);
                      },
                      focusNode: _four,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0),
                      //validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      //onSaved: (v) => data["name"] = v,
                    ),
                    width: 30.0,
                  ),
                  myRPadding(),
                  Container(
                    child: TextField(
                      controller: _fiveController,
                      onTap: () {
                        _fiveController.text = "";
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.next,
                      onChanged: (term) {
                        fieldFocusChange(context, _five, _six);
                      },
                      focusNode: _five,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0),
                      //validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      //onSaved: (v) => data["name"] = v,
                    ),
                    width: 30.0,
                  ),
                  myRPadding(),
                  Container(
                    child: TextField(
                      controller: _sixController,
                      onTap: () {
                        _sixController.text = "";
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      textInputAction: TextInputAction.done,
                      focusNode: _six,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0),
                      //validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      //onSaved: (v) => data["name"] = v,
                    ),
                    width: 30.0,
                  ),
                ],
              ),
            ),
            Container(height: 24.0,),
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
                              builder: (c) => PickPlanScreen(response)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        museoText("Verifikasi",
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
    );
  }

  @override
  void finishLoading(isSuccess, {message}) {
    MyDialog(context).pop();
    if (!isSuccess) MyDialog(context).error(message);
    else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => PickPlanScreen(response)));
  }

  @override
  void startLoading() {
    MyDialog(context).loading();
  }
}
