import 'package:flutter/material.dart';
import 'package:xplore_mandiri/navigationn/tabungan_rupiah_tab.dart';

import '../my_widget.dart';

class TabunganScreen extends StatefulWidget {
  @override
  _TabunganScreenState createState() => _TabunganScreenState();
}

class _TabunganScreenState extends State<TabunganScreen>
    with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            museoText("tabungan"),
            Container(width: 8.0,),
            museoText("mandiri", bold: FontWeight.bold),
            Container(width: 32.0,),
          ],
        ),
        bottom: TabBar(
          labelColor: Colors.black,
          isScrollable: true,
          controller: controller,
          tabs: <Widget>[
            Tab(
              text: "Tabungan Rupiah",
            ),
            Tab(
              text: "Tabungan Valas",
            ),
            Tab(
              text: "Tabungan Tabungan Rencana",
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          TabunganRupiahTab(),
          TabunganRupiahTab(),
          TabunganRupiahTab(),
        ],
        controller: controller,

      ),
    );
  }
}
