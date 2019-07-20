import 'package:xplore_mandiri/onboarding/models/session.dart';

class CreateSessionResponse {

  bool success;
  Session session;
  String message;

	CreateSessionResponse.fromJsonMap(Map<String, dynamic> map):
		success = map["success"],
		session = Session.fromJsonMap(map["data"]),
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = success;
		data['data'] = session == null ? null : session.toJson();
		data['message'] = message;
		return data;
	}
}
