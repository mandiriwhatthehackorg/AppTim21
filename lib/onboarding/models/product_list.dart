
class ProductList {

  String productCode;
  String productName;

	ProductList.fromJsonMap(Map<String, dynamic> map): 
		productCode = map["productCode"],
		productName = map["productName"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['productCode'] = productCode;
		data['productName'] = productName;
		return data;
	}
}
