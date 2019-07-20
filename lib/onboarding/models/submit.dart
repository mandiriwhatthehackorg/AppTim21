
class Submit {

  String viewName;
  String token;
  Object data;

	Submit.fromJsonMap(Map<String, dynamic> map):
		viewName = map["viewName"],
		token = map["token"],
		data = map["data"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['viewName'] = viewName;
		data['token'] = token;
		data['data'] = data;
		return data;
	}
}
