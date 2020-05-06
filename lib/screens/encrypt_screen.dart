import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secretimage/libs/stegify_lib.dart';
import 'package:secretimage/screens/base_screen.dart';
import 'package:secretimage/widgets/button.dart';

class EncryptScreen extends StatefulWidget {
  final File image;

  @override
  _EncryptScreenState createState() => _EncryptScreenState();

  EncryptScreen({@required this.image});
}

class _EncryptScreenState extends State<EncryptScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  bool loading = false;
  StegifyLib stegifyLib = StegifyLib();

  encryptImage() async {
    setState(() {
      loading = true;
    });

    stegifyLib.saveImage(widget.image, messageController.text).then((result) {
      setState(() {
        messageController.clear();
        loading = false;
      });
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Encrypt Image',
      content: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Image.file(
              widget.image,
              fit: BoxFit.fill,
              frameBuilder:
                  (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
                return Container(
                  padding: EdgeInsets.all(2.0),
                  child: child,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Form(
                  key: _formKey,
                  child: TextFormField(
                    style: TextStyle().copyWith(color: Colors.white),
                    maxLines: 10,
                    controller: messageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      labelText: 'Secret message',
                      alignLabelWithHint: true,
                    ),
                  )),
            ),
            !loading ? primaryButton(
                text: 'Save',
                color: Theme.of(context).primaryColor,
                action: () => encryptImage(),
                icon: Icons.cloud_download): CircularProgressIndicator(semanticsLabel: 'Saving Image',)
          ],
        ),
      ),
    );
  }
}
