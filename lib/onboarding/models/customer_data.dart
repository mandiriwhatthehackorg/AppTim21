
class CustomerData {

  String address;
  String name;

	CustomerData.fromJsonMap(Map<String, dynamic> map): 
		address = map["address"],
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['address'] = address;
		data['name'] = name;
		return data;
	}
}
