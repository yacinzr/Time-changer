import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

//import 'package:intl/intl.dart';
class Worldtime {
  String location;
  String url;
  String flag;
  String time;
  bool isdaytime;

  Worldtime({this.location, this.flag, this.url});

  Future<Void> gettime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'].substring(1, 3);
      // print(utc_offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc_offset)));
      isdaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('the problem is $e');
      time = 'we could\'t found time';
    }
  }
}
