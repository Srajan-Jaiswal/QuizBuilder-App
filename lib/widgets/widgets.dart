import 'package:flutter/material.dart';



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
