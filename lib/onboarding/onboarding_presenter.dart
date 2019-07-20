import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xplore_mandiri/utils/loading.dart';

import '../strings.dart';
import 'models/create_session_response.dart';
import 'models/otp_detail.dart';
import 'models/otp_response.dart';
import 'models/submit.dart';
import 'models/submit_response.dart';

postCreateSession(body, MyLoading view) async {
  view.startLoading();
  var response = await http
      .post(CREATE_SESSION,
          headers: {
            "Content-Type": "application/json"
          },
          body: jsonEncode(body))
      .catchError((err) {
    view.finishLoading(false, message: err.toString());
  });

  try {
    var res = jsonDecode(response.body);
    print(res);
    if (res["success"] == true) {
      var token = CreateSessionResponse.fromJsonMap(res).session.token;
      print(token);
      saveToken(token, 1);
      view.finishLoading(true);
    } else {
      view.finishLoading(false, message: res["message"]);
    }
  } catch (e) {
    view.finishLoading(false, message: "Internal Server Error");
  }
}

saveToken(String token, index) async {
  var ref = await SharedPreferences.getInstance();
  ref.setString(TOKEN, token);
  ref.setInt(ONBOARD, index);
}

Future<OtpDetail> postValidateOtp(body, MyLoading view) async {
  view.startLoading();
  var ref = await SharedPreferences.getInstance();
  var token = ref.getString(TOKEN) ?? 'yo';
  print(body);
  print(token);

  var response = await http
      .post(VALIDATE_OTP,
          headers: {
            "Authorization": "Bearer "+token,
            "Content-Type": "application/json"
          },
          body: body)
      .catchError((err) {
    print(err);
    view.finishLoading(false, message: err.toString());
  });

  try {
    var res = jsonDecode(response.body);
    print(res);
    if (res["success"] == true) {
      OtpDetail respon = OtpResponse.fromJsonMap(res).dataa.dataa;
      var token = OtpResponse.fromJsonMap(res).dataa.token;
      saveToken(token, 2);

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

Future<Submit> postSubmitData(body, MyLoading view) async {
  view.startLoading();
  var ref = await SharedPreferences.getInstance();
  var token = ref.getString(TOKEN) ?? 'yo';
  print(body);
  print(token);

  var response = await http
      .post(SUBMIT_DATA,
      headers: {
        "Authorization": "Bearer "+token,
        "Content-Type": "application/json"
      },
      body: body)
      .catchError((err) {
    print(err);
    view.finishLoading(false, message: err.toString());
  });

  try {
    var res = jsonDecode(response.body);
    print(res);
    if (res["success"] == true) {
      Submit respon = SubmitResponse.fromJsonMap(res).submit;
      var token = respon.token;
      saveToken(token, 3);
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

