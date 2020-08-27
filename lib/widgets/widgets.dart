import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 24),
      children: <TextSpan>[
        TextSpan(
            text: 'QUIZ',
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
        TextSpan(
            text: 'BUILDER',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.red)),
      ],
    ),
  );
}

Widget redButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(30),
    ),
    height: 55,
    alignment: Alignment.center,
    width:buttonWidth != null ? buttonWidth:MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 16),
    ),
  );
}
