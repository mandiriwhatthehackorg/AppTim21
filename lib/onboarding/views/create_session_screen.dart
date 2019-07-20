import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xplore_mandiri/my_widget.dart';
import 'package:xplore_mandiri/onboarding/views/validate_otp_screen.dart';
import 'package:xplore_mandiri/utils/loading.dart';

class CreateSessionScreen extends StatefulWidget {
  @override
  _CreateSessionScreenState createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen>
    implements MyLoading {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data = {};

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _nikFocus = FocusNode();
  final FocusNode _nohpFocus = FocusNode();
  var textDate = TextEditingController();

  _pickDate() {
    var maxYear = DateTime.now().year - 13;
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    ).then((v) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(v);
        textDate.text = formattedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: museoText("Buka rekening baru"),
      ),
      body: Column(
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
                      child: museoText("1",
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
                museoText("Buat akun aplikasi mandiri online.", fontSize: 20.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      fieldFocusChange(context, _emailFocus, _nikFocus);
                    },
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                    validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                    onSaved: (v) => data["email"] = v,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      fieldFocusChange(context, _nikFocus, _nohpFocus);
                    },
                    focusNode: _nikFocus,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "NIK (Nomor KTP, KITAS, Paspor)",
                    ),
                    validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                    onSaved: (v) => data["nik"] = v,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    focusNode: _nohpFocus,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Nomor Telepon",
                    ),
                    validator: (v) => v.isEmpty ? 'Tidak boleh kosong' : null,
                    onSaved: (v) => data["phone"] = v,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickDate();
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: textDate,
                        decoration: InputDecoration(
                          labelText: "Tanggal Lahir",
                          prefixIcon: Icon(Icons.date_range),
                        ),
                        validator: (v) =>
                            v.isEmpty ? 'Tidak boleh kosong' : null,
                        onSaved: (v) => data["ttl"] = v.toString(),
                      ),
                    ),
                  ),
                  Container(height: 16.0,),
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
//                  if (!_formKey.currentState.validate()) {
//                    print("FAILED");
//                    return;
//                  }
//                  _formKey.currentState.save();
//                  print(data);
                            //postLogin(data, this);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => ValidateOtpScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              museoText("Lanjut",
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
          ),
        ],
      ),
    );
  }

  @override
  void finishLoading(isSuccess, {message}) {
    MyDialog(context).pop();
    if (!isSuccess)
      MyDialog(context).error(message);
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => ValidateOtpScreen()));
  }

  @override
  void startLoading() {
    MyDialog(context).loading();
  }
}
