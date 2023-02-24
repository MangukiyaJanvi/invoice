import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:invoice/Model.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey genKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ModelData list = ModalRoute.of(context)!.settings.arguments as ModelData;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
                child: RepaintBoundary(
                  key: genKey,
                  child: Column(
                    children: [
                      Text(
                        "D-Mart",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Text(
                        "AVENUE SUPERMARTS LTD",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Text(
                        "CIN :- L51900MH2000PLC126473",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "GSTIN : 24AACCA8432H1ZW",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "FSSAI NO.10715026000439",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Text(
                        "DMART MOTERA",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "City Gold Multiplex Compound.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Motera Stadium Road, Sabarmati, Motera",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ahmedabad - 380005",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              height: 1,
                              color: Colors.black,
                              width: 68,
                            ),
                          ),
                          Text(
                            "Phone: 079-30936500",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              height: 1,
                              color: Colors.black,
                              width: 68,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Text(
                        "TAX INVOICE",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Customer Name : ${list.m1?.cname}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Customer Address : ${list.m1?.cadd}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Customer Contact Number : ${list.m1?.ccall}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("Particulars"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text("Rate"),
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Expanded(
                        child: ListView.builder(
                          itemCount: list.productList.length,
                          itemBuilder: (context, index) => Box(
                              list.productList[index].name!,
                              list.productList[index].price!),
                        ),
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                  "TOTAL ITEMS : ${list.productList.length}"),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text("TOTAL AMOUNT : ${sum}"),
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      await takePicture();
                    },
                    child: Text("Save Image"),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> takePicture() async {
    RenderRepaintBoundary? boundary =
        genKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await boundary!.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    await ImageGallerySaver.saveImage(pngBytes, name: "invoice");
  }

  Widget Box(String name, String price) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Text("$name"),
          ),
        ),
        Expanded(
          child: Container(
            child: Text("$price"),
          ),
        ),
      ],
    );
  }
}
