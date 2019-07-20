
class CardList {

  String cardCode;
  String cardName;

	CardList.fromJsonMap(Map<String, dynamic> map): 
		cardCode = map["cardCode"],
		cardName = map["cardName"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cardCode'] = cardCode;
		data['cardName'] = cardName;
		return data;
	}
}
