import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xplore_mandiri/utils/loading.dart';

import '../strings.dart';
import 'models/create_session_response.dart';
import 'models/otp_detail.dart';
import 'models/otp_response.dart';

postCreateSession(body, MyLoading view) async {
  view.startLoading();
  var response = await http.post(CREATE_SESSION,
      body: body).catchError((err) {
    view.finishLoading(false, message: err.toString());
  });

  try {
    var res = jsonDecode(response.body);
    if (res["success"] == true) {

      var token = CreateSessionResponse.fromJsonMap(res).session.token;
      print(token);
      saveToken(token);

      view.finishLoading(true);
    } else {
      view.finishLoading(false, message: res["message"]);
    }
  } catch(e) {
    view.finishLoading(false, message: "Internal Server Error");
  }
}

saveToken(String token) async {
  var ref = await SharedPreferences.getInstance();
  ref.setString(TOKEN, token);
}

Future<OtpDetail> postValidateOtp(body, MyLoading view) async {

  view.startLoading();
  var ref = await SharedPreferences.getInstance();
  var token = ref.getString(TOKEN) ?? 'yo';
  print(body);

  var response = await http.post(VALIDATE_OTP,
      headers: {"Authorization": sessionToken, "Content-Type": "application/json"}, body: body).catchError((err) {
    print(err);
    view.finishLoading(false, message: err.toString());
  });

  try {
    var res = jsonDecode(response.body);
    print(res);
    if (res["success"] == true) {
      OtpDetail respon = OtpResponse.fromJsonMap(res).dataa.dataa;
      view.finishLoading(true);
      return respon;
    } else {
      view.finishLoading(false, message: res["message"]);
      return null;
    }
  } catch (e) {
    print(e);
    view.finishLoading(false, message: "Internal Server Error");
    return null;
  }
}