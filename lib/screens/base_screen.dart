import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BaseScreen extends StatelessWidget {
  final Widget content;
  final String title;

  BaseScreen({@required this.content, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff5165D1), Color(0xffDE59EA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 20, left: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  content
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
