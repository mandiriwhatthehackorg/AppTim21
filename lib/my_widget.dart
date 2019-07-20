import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

const navyBlue = 0xff041b34;
const twilight = 0xff0a3e79;
//0a3e79

mainLogo(double width, double height) {
  return Image.asset(
    "assets/images/mandiri_online.png",
    width: width,
    height: height,
  );
}

secondLogo(double width, double height){
  return Image.asset(
    "assets/images/bitmap.png",
    width: width,
    height: height,
  );
}

fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

museoText(String title,
    {Color color,
    double fontSize,
    FontWeight bold,
    TextOverflow overflow,
    TextAlign align,
    bool price = false,
    bool number = false}) {
  FlutterMoneyFormatter fmf;
  if (number || price) {
    fmf = new FlutterMoneyFormatter(
      amount: title != null ? double.parse(title) : 0.0,
      settings: MoneyFormatterSettings(
        symbol: !number ? 'IDR' : '',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );
  }

  return Text(
    title != null ? price || number ? fmf.output.symbolOnRight : title : "",
    style: TextStyle(
      fontFamily: "myriad",
      color: color,
      fontSize: fontSize,
      fontWeight: bold,
    ),
    overflow: overflow,
    textAlign: align,
  );
}

myCPadding() {
  return Container(
    height: 8.0,
  );
}

myRPadding() {
  return Container(
    width: 8.0,
  );
}

dummyData(context, index) {
  return index<2?InkWell(
    onTap: () {
//      Navigator.push(
//          context, MaterialPageRoute(builder: (c) => PplDetailScreen()));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "https://img.okezone.com/content/2017/02/26/470/1628410/mengusung-nuansa-hijau-di-hunian-terbuka-XjfJBsVQ1J.jpg",
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Container(
            height: 13.0,
          ),
          museoText("Mudah beli rumah",
              fontSize: 20.0, color: Colors.blue[900], bold: FontWeight.bold),
          museoText(
            "dengan mandiri kpr milenial",
            fontSize: 18.0,
          ),
        ],
      ),
    ),
  ):Container(
    width: 350.0,
    height: 300.0,
    child: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(height: 40.0),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      museoText("nikmati semua",
                          color: Colors.white,
                          fontSize: 26.0,
                          bold: FontWeight.bold),
                      museoText("kemudahan dalam",
                          color: Colors.white,
                          fontSize: 26.0,
                          bold: FontWeight.bold),
                      museoText("satu genggaman",
                          color: Colors.white,
                          fontSize: 26.0,
                          bold: FontWeight.bold),
                    ],
                  ),

                  RaisedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        museoText("Buka rekening sekarang",
                            color: Colors.blue[900], bold: FontWeight.bold),
                        Container(width: 50.0,),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue[900],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Image.asset("assets/images/hand.png", width: 119.0, height: 141.0,),
        ),
      ],
    ),
  );
}

dummyList(context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (c, i) => dummyData(c,i),
      itemCount: 3,
    ),
  );
}
