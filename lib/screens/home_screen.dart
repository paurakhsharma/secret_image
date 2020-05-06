import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secretimage/screens/base_screen.dart';
import 'package:secretimage/screens/decrypt_screen.dart';
import 'package:secretimage/screens/encrypt_select_screen.dart';
import 'package:secretimage/widgets/button.dart';

class HomeScreen extends StatelessWidget {

  void decryptImage(context) async {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DecryptScreen(
            image: image,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Secret Image',
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          primaryButton(
              text: 'Encrypt Image',
              color: Theme.of(context).primaryColor,
              action: () {
                print('navigate');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => EncryptSelectScreen()));
              },
              icon: Icons.lock_outline),
          primaryButton(
              text: 'Decrypt Image',
              color: Theme.of(context).accentColor,
              action: () => decryptImage(context),
              icon: Icons.lock_open)
        ],
      ),
    );
  }
}
