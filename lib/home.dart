import 'package:flutter/material.dart';
import 'package:invoice/Model.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtcustomername = TextEditingController();
  TextEditingController txtcustomernumber = TextEditingController();
  TextEditingController txtcustomeradd = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  String? name, phone, add;
  var key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Invoice Generator"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Items Name'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Items Price'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: txtname,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color(0xFF203A43),
                                style: BorderStyle.solid,
                                width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: txtprice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Price",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Color(0xFF203A43),
                                style: BorderStyle.solid,
                                width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Model m1 =
                          Model(price: txtprice.text, name: txtname.text);
                      l1.add(m1);
                      setState(() {
                        int i = int.parse(txtprice.text);
                        sum = (sum + i);
                        print(sum);
                        txtname.clear();
                        txtprice.clear();
                      });
                    },
                    child: Text("Add"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: SizedBox(
                            height: 400,
                            width: 400,
                            child: Form(
                              key: key1,
                              child: ListView(
                                children: [
                                  Text("Enter The Customer Name"),
                                  TextFormField(
                                    controller: txtcustomername,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The data";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Enter The Customer Number"),
                                  TextFormField(
                                    controller: txtcustomernumber,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The data";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Enter The Customer Address"),
                                  TextFormField(
                                    controller: txtcustomeradd,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The data";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        name = txtcustomername.text;
                                        phone = txtcustomernumber.text;
                                        add = txtcustomeradd.text;
                                        Model m1 = Model(
                                            cname: name,
                                            cadd: add,
                                            ccall: phone);
                                        ModelData modeldata =
                                            ModelData(productList: l1, m1: m1);
                                        setState(() {
                                          if (key1.currentState!.validate()) {
                                            var msg =
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('Processing Data'),
                                              ),
                                            );
                                            msg.closed.then(
                                              (value) => Navigator.pushNamed(
                                                  context, '2',
                                                  arguments: modeldata),
                                            );
                                          }
                                        });
                                      },
                                      child: Text("Next"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: l1.length,
                  itemBuilder: (context, index) =>
                      Box(l1[index].name!, l1[index].price!, index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Box(String n, String p, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 1),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(n),
            Text(p),
            IconButton(
              onPressed: () {
                txtname = TextEditingController(text: "$n");
                txtprice = TextEditingController(text: "$p");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: txtname,
                                  keyboardType: TextInputType.text,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFF203A43),
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: txtprice,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Price",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFF203A43),
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Model m1 =
                                Model(price: txtprice.text, name: txtname.text);
                            l1[index] = m1;
                            setState(() {
                              txtname.clear();
                              txtprice.clear();
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Edit"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  l1.removeAt(index);
                });
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
