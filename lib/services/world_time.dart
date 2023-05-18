import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';



class WorldTime{
  String location;
  late String time;
  String flag;
  String url;
  bool dayTime=true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    url='http://worldtimeapi.org/api/timezone/$url';
    final uri=Uri.parse(url);
    final response = await http.get(uri);
    final body=response.body;
    Map data=jsonDecode(body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    dayTime = now.hour>6 && now.hour<20? true:false;

    time=DateFormat.jm().format(now);
  }
}