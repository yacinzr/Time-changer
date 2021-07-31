import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map datam = {};
  @override
  Widget build(BuildContext context) {
    datam =
        datam.isNotEmpty ? datam : ModalRoute.of(context).settings.arguments;
    print('yooooooooo $datam');
    String image = datam['isdaytime'] ? 'day.png' : 'night.png';
    Color c = datam['isdaytime'] ? Colors.black:Colors.white;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/asset/$image'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 220.0, 30.0, 80.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/chooselocation');
                    setState(() {
                      datam = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isdaytime': result['isdaytime']
                      };
                    });
                  },
                  icon: Icon(Icons.location_on),
                  label: Text(
                    "choose  location",
                    style: TextStyle(fontSize: 29.0,color: c),
                  
                  )),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:120.0),
                    child: Text(
                      datam['location'],
                      style: TextStyle(fontSize: 29.0, color: c),
                    ),
                  ),
                ],
              ),
              Text(
                datam['time'],
                style: TextStyle(fontSize: 29.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
