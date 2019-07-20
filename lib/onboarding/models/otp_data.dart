import 'package:xplore_mandiri/onboarding/models/otp_detail.dart';

class OtpData {

  String viewName;
  String token;
  OtpDetail dataa;

	OtpData.fromJsonMap(Map<String, dynamic> map):
		viewName = map["viewName"],
		token = map["token"],
		dataa = OtpDetail.fromJsonMap(map["data"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['viewName'] = viewName;
		data['token'] = token;
		data['dataa'] = dataa == null ? null : dataa.toJson();
		return data;
	}
}
