import 'package:xplore_mandiri/onboarding/models/otp_data.dart';

class OtpResponse {

  bool success;
  OtpData dataa;
  String message;

	OtpResponse.fromJsonMap(Map<String, dynamic> map):
		success = map["success"],
		dataa = OtpData.fromJsonMap(map["data"]),
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = success;
		data['data'] = dataa == null ? null : dataa.toJson();
		data['message'] = message;
		return data;
	}
}
