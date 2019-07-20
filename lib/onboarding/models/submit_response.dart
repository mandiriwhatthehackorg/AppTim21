import 'package:xplore_mandiri/onboarding/models/submit.dart';

class SubmitResponse {

  bool success;
  Submit submit;
  String message;

	SubmitResponse.fromJsonMap(Map<String, dynamic> map):
		success = map["success"],
		submit = Submit.fromJsonMap(map["data"]),
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = success;
		data['data'] = submit == null ? null : submit.toJson();
		data['message'] = message;
		return data;
	}
}
