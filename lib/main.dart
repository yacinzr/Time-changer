import 'package:flutter/material.dart';
import 'package:revision/pages/chooselocation.dart';
import 'package:revision/pages/home.dart';
import 'package:revision/pages/loding.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loding(),
        '/home': (context) => Home(),
        '/chooselocation': (context) => Chooseyoulocation(),
      },
    ));
