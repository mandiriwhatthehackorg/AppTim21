
class Submit {

  String viewName;
  String token;
  Object dataa;

	Submit.fromJsonMap(Map<String, dynamic> map):
		viewName = map["viewName"],
		token = map["token"],
		dataa = map["data"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['viewName'] = viewName;
		data['token'] = token;
		data['dataa'] = dataa;
		return data;
	}
}
