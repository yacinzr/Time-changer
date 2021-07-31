import 'package:flutter/material.dart';
import 'package:revision/service/worldtime.dart';

class Chooseyoulocation extends StatefulWidget {
  @override
  _ChooseyoulocationState createState() => _ChooseyoulocationState();
}

class _ChooseyoulocationState extends State<Chooseyoulocation> {
  List<Worldtime> mylist = [
    Worldtime(location: 'algeria', flag: 'ALG', url: 'Africa/Algiers'),
    Worldtime(location: 'USA', flag: 'us', url: 'America/New_York'),
    Worldtime(location: 'Russia', flag: 'rs', url: 'Europe/Moscow'),
    Worldtime(location: 'japan', flag: 'jp', url: 'Asia/Tokyo'),
    Worldtime(location: 'China', flag: 'ch', url: 'Asia/Shanghai'),
  ];

  void updattime(index) async {
    Worldtime instance = mylist[index];
    await instance.gettime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime': instance.isdaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose your location"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
                elevation: 3,
                child: ListTile(
                  onTap: () {
                    updattime(index);
                    print(mylist[index].location);
                  },
                  leading: Image.asset('lib/asset/${mylist[index].flag}.png'),
                  title: Text(mylist[index].location),
                ),
              ),
            );
          }),
    );
  }
}
