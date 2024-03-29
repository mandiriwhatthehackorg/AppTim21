import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xplore_mandiri/onboarding/models/branch_list.dart';
import 'package:xplore_mandiri/onboarding/models/card_list.dart';
import 'package:xplore_mandiri/onboarding/models/otp_detail.dart';
import 'package:xplore_mandiri/onboarding/models/product_list.dart';
import 'package:xplore_mandiri/onboarding/views/upload_image_screen.dart';
import 'package:xplore_mandiri/utils/loading.dart';

import '../../my_widget.dart';
import '../onboarding_presenter.dart';

class PickPlanScreen extends StatefulWidget {
  OtpDetail data;

  PickPlanScreen(this.data);

  @override
  _PickPlanScreenState createState() => _PickPlanScreenState();
}

class _PickPlanScreenState extends State<PickPlanScreen> implements MyLoading{
  CardList selectedCard;
  ProductList selectedProduct;
  BranchList selectedBranch;

  Map<String, dynamic> data = {};
  final _formKey = GlobalKey<FormState>();
  bool pickGold = false;
  bool pickSilver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfffafcff),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: museoText("Buka rekening baru"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(twilight),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    museoText("tabungan rupiah", color: Colors.white),
                    secondLogo(86.0, 30.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue[900],
                        child: museoText("2",
                            color: Colors.white,
                            bold: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      museoText(" dari 4", color: Colors.grey, fontSize: 20.0),
                    ],
                  ),
                  Container(
                    height: 8.0,
                  ),
                  museoText("Pilih kartu debit mandiri.", fontSize: 20.0),
                  Container(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              pickSilver = false;
                              pickGold = true;
                              data["cardType"] = "gold";
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/gold.png"),
                              ),
                              !pickGold
                                  ? museoText(
                                      "Kartu Debit Gold",
                                    )
                                  : museoText("Kartu Debit Gold",
                                      fontSize: 18.0, bold: FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              pickSilver = true;
                              pickGold = false;
                              data["cardType"] = "silver";
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/silver.png"),
                              ),
                              !pickSilver
                                  ? museoText("Kartu Debit Silver")
                                  : museoText("Kartu Debit Silver",
                                      fontSize: 18.0, bold: FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 16.0,
                  ),
                  DropdownButton<ProductList>(
                    hint: museoText(selectedProduct?.productName,
                        color: Colors.blue[900]),
                    isExpanded: true,
                    value: selectedProduct,
                    onChanged: (ProductList newValue) {
                      setState(() {
                        selectedProduct = newValue;
                        data["productType"] = selectedProduct.productName;
                      });
                    },
                    items: widget.data.productList.map((ProductList data) {
                      return new DropdownMenuItem<ProductList>(
                        value: data,
                        child: museoText(
                          data?.productName,
                          color: Colors.blue[900],
                        ),
                      );
                    })?.toList(),
                  ),
                  DropdownButton<BranchList>(
                    hint: museoText(selectedBranch?.branchName,
                        color: Colors.blue[900]),
                    isExpanded: true,
                    value: selectedBranch,
                    onChanged: (BranchList newValue) {
                      setState(() {
                        selectedBranch = newValue;
                        data["branchCode"] = selectedBranch.branchCode;
                      });
                    },
                    items: widget.data.branchList.map((BranchList data) {
                      return new DropdownMenuItem<BranchList>(
                        value: data,
                        child: museoText(
                          data?.branchName,
                          color: Colors.blue[900],
                        ),
                      );
                    })?.toList(),
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Nama Ibu', prefixIcon: Icon(Icons.person)),
                      validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                      onSaved: (v) => data["motherName"] = v,
                    ),
                  ),
                  Container(
                    height: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                          ),
                          color: Colors.blue[900],
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              print("FAILED");
                              return;
                            }
                            _formKey.currentState.save();
                            print(data);
                            postSubmitData(jsonEncode(data), this);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              museoText("Verifikasi",
                                  color: Colors.white,
                                  bold: FontWeight.bold,
                                  fontSize: 18.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      /*body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButton<CardList>(
                hint: museoText(selectedCard?.cardCode, color: Colors.blue[900]),
                isExpanded: true,
                value: selectedCard,
                onChanged: (CardList newValue) {
                  setState(() {
                    selectedCard = newValue;
                  });
                },
                items: widget.data.cardList.map((CardList data) {
                  return new DropdownMenuItem<CardList>(
                    value: data,
                    child: museoText(
                      data?.cardCode,
                      color: Colors.blue[900],
                    ),
                  );
                })?.toList(),
              ),
              DropdownButton<ProductList>(
                hint: museoText(selectedProduct?.productCode,
                    color: Colors.blue[900]),
                isExpanded: true,
                value: selectedProduct,
                onChanged: (ProductList newValue) {
                  setState(() {
                    selectedProduct = newValue;
                  });
                },
                items: widget.data.productList.map((ProductList data) {
                  return new DropdownMenuItem<ProductList>(
                    value: data,
                    child: museoText(
                      data?.productCode,
                      color: Colors.blue[900],
                    ),
                  );
                })?.toList(),
              ),
              DropdownButton<BranchList>(
                hint: museoText(selectedBranch?.branchCode, color: Colors.blue[900]),
                isExpanded: true,
                value: selectedBranch,
                onChanged: (BranchList newValue) {
                  setState(() {
                    selectedBranch = newValue;
                  });
                },
                items: widget.data.branchList.map((BranchList data) {
                  return new DropdownMenuItem<BranchList>(
                    value: data,
                    child: museoText(
                      data?.branchCode,
                      color: Colors.blue[900],
                    ),
                  );
                })?.toList(),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Ibu',
                ),
                validator: (v) =>
                v.isEmpty ? 'Tidak boleh kosong' : null,
                onSaved: (v) => data["amount"] = v,
              ),

              RaisedButton(
                onPressed: (){
//                  if (!_formKey.currentState.validate()) {
//                    print("FAILED");
//                    return;
//                  }
//                  _formKey.currentState.save();
//                  print(data);
                  //postLogin(data, this);
//                  Navigator.pushReplacement(
//                      context, MaterialPageRoute(builder: (c) => ValidateOtpScreen()));
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  @override
  void finishLoading(isSuccess, {message}) {
    MyDialog(context).pop();
    if (!isSuccess)
      MyDialog(context).error(message);
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => UploadImageScreen()));
  }

  @override
  void startLoading() {
    MyDialog(context).loading();
  }
}
