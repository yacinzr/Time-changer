import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:revision/service/worldtime.dart';
import 'package:intl/intl.dart';

class Loding extends StatefulWidget {
  @override
  _LodingState createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  String timee;
  void setupworldtime() async {
    Worldtime instance =
        Worldtime(location: 'El_Aaiun', flag: 'aun', url: 'Africa/Abidjan');
    String url = instance.url;
    print(url);
    await instance.gettime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isdaytime': instance.isdaytime
      }
    );
    setState(() {
      timee = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupworldtime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitRotatingCircle(
  color: Colors.blue,
  size: 50.0,
)
      ),
    );
  }
}
