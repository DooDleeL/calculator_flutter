import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Button(BuildContext context, text, onPressed, color)
{
  return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:  MaterialStateProperty.all<Color>(color),
      ),
      onPressed: onPressed,
      child: Text('$text'),
  );
}