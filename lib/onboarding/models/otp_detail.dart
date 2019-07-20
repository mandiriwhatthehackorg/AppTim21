import 'package:xplore_mandiri/onboarding/models/card_list.dart';
import 'package:xplore_mandiri/onboarding/models/product_list.dart';
import 'package:xplore_mandiri/onboarding/models/customer_data.dart';
import 'package:xplore_mandiri/onboarding/models/branch_list.dart';

class OtpDetail {

  List<CardList> cardList;
  List<ProductList> productList;
  CustomerData customerData;
  List<BranchList> branchList;

	OtpDetail.fromJsonMap(Map<String, dynamic> map):
		cardList = List<CardList>.from(map["cardList"].map((it) => CardList.fromJsonMap(it))),
		productList = List<ProductList>.from(map["productList"].map((it) => ProductList.fromJsonMap(it))),
		customerData = CustomerData.fromJsonMap(map["customerData"]),
		branchList = List<BranchList>.from(map["branchList"].map((it) => BranchList.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cardList'] = cardList != null ? 
			this.cardList.map((v) => v.toJson()).toList()
			: null;
		data['productList'] = productList != null ? 
			this.productList.map((v) => v.toJson()).toList()
			: null;
		data['customerData'] = customerData == null ? null : customerData.toJson();
		data['branchList'] = branchList != null ? 
			this.branchList.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
