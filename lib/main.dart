import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secretimage/libs/stegify_lib.dart';
import 'package:secretimage/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xff203442),
        accentColor: Color(0xff422041)
      ),
      home: HomeScreen(),
    );
  }
}