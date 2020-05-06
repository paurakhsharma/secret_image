import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secretimage/screens/base_screen.dart';
import 'package:secretimage/screens/encrypt_screen.dart';
import 'package:secretimage/widgets/button.dart';

class EncryptSelectScreen extends StatelessWidget {
  Future getImage(context, source) async {
    File image = await ImagePicker.pickImage(source: source);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EncryptScreen(
          image: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Encrypt Image',
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          primaryButton(
              text: 'Load from Gallary',
              color: Theme.of(context).primaryColor,
              action: () => getImage(context, ImageSource.gallery),
              icon: Icons.image),
          primaryButton(
              text: 'Take Picture',
              color: Theme.of(context).accentColor,
              action: () => getImage(context, ImageSource.camera),
              icon: Icons.camera)
        ],
      ),
    );
  }
}
