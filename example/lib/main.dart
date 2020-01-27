import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:flutter/services.dart';
import 'package:exception_toast/exception_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(child: Text('call exception'), onPressed: () {
            ExceptionToast.show(error: 'my error message', trace: null);
          },),
        ),
      ),
    );
  }
}
