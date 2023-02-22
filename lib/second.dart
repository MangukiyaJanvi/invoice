import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invoice/Model.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Model> list =
        ModalRoute.of(context)!.settings.arguments as List<Model>;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: RepaintBoundary(
            key: globalKey,
            child: ListView(
              children: [
                Center(
                    child: Text(
                  "D-Mart",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Center(
                  child: Text(
                    "AVENUE SUPERMARTS LTD",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Center(
                  child: Text(
                    "CIN :- L51900MH2000PLC126473",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "GSTIN : 24AACCA8432H1ZW",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "FSSAI NO.10715026000439",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Center(
                  child: Text(
                    "DMART MOTERA",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "City Gold Multiplex Compound.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Motera Stadium Road, Sabarmati, Motera",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Ahmedabad - 380005",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        height: 1,
                        color: Colors.black,
                        width: 140,
                      ),
                    ),
                    Text(
                      "Phone: 079-30936500",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        height: 1,
                        color: Colors.black,
                        width: 140,
                      ),
                    ),
                  ],
                ),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Center(
                  child: Text(
                    "TAX INVOICE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text("${list[0].cname}"),
                Text("${list[0].cadd}"),
                Text("${list[0].ccall}"),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Row(
                  children: [
                    Expanded(child: Container(child: Text("Particulars"),),),
                    Expanded(child: Container(child: Text("Rate"),),),
                  ],
                ),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Row(
                  children: [
                    Expanded(child: Container(child: Text("${list[0].name}"),),),
                    Expanded(child: Container(child: Text("${list[0].price}"),),),
                  ],
                ),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                Row(
                  children: [
                    Expanded(child: Container(child: Text("TOTAL ITEMS : ${list.length-1}"),),),
                    Expanded(child: Container(child: Text("TOTAL AMOUNT : ${list[0].price}"),),),
                  ],
                ),
                Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                ElevatedButton(onPressed: (){

                }, child:Text("Save Image")),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void captureWidget() async {

     RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

     ui.Image image = await boundary!.toImage();

     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

     Uint8List pngBytes = byteData.buffer.asUint8List();

    return pngBytes;
  }
}
