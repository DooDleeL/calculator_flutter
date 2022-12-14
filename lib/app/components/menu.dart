import 'package:flutter/material.dart';
import 'package:teste/app/pages/main.dart';

Widget Menu(BuildContext context){
  return Drawer(
      child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Calculadora"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Calculadora')),);
              },
            ),
          ]
      )
  );
}