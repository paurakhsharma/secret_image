import 'package:flutter/material.dart';

Widget primaryButton({@required text, @required color, @required action, @required icon}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    width: 220,
    height: 70,
    child: RaisedButton(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 5,),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
      onPressed: () => action(),
    ),
  );
}
