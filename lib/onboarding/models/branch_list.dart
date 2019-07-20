
class BranchList {

  String branchCode;
  String branchName;
  String branchAddress;

	BranchList.fromJsonMap(Map<String, dynamic> map): 
		branchCode = map["branchCode"],
		branchName = map["branchName"],
		branchAddress = map["branchAddress"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['branchCode'] = branchCode;
		data['branchName'] = branchName;
		data['branchAddress'] = branchAddress;
		return data;
	}
}
