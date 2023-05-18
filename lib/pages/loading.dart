import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'dayTime': instance.dayTime,

    }
    );
  }

  @override
  void initState(){
    super.initState();

    setupWorldTime();

  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.white,
            size: 50.0,
          )
      )
    );
  }
}
