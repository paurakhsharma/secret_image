import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secretimage/libs/stegify_lib.dart';
import 'package:secretimage/screens/base_screen.dart';
import 'package:secretimage/widgets/button.dart';

class DecryptScreen extends StatefulWidget {
  final File image;

  @override
  _DecryptScreenState createState() => _DecryptScreenState();

  DecryptScreen({@required this.image});
}

class _DecryptScreenState extends State<DecryptScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  bool loading = false;
  StegifyLib stegifyLib = StegifyLib();

  decodeMessage() async {
    setState(() {
      loading = true;
    });
    var message = await stegifyLib.decodeImage(widget.image);
    setState(() {
      loading = false;
    });
    messageController.text = message;
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
            !loading ? primaryButton(
                text: 'Decrypt',
                color: Theme.of(context).primaryColor,
                action: () => decodeMessage(),
                icon: Icons.lock_open): CircularProgressIndicator(),
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
          ],
        ),
      ),
    );
  }
}
