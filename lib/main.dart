import 'package:flutter/material.dart';
import 'package:invoice/Model.dart';
import 'package:invoice/second.dart';

import 'home.dart';

List<Model> l1=[];
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Home(),
        '2':(context) => Second(),
      },
    ),
  );
}