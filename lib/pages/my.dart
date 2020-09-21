import 'package:flutter/material.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfffafafc),
      body: Container(
        child: Text('我的'),
      ),
    );
  }
}