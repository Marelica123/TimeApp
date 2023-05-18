import 'package:flutter/material.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map dat={};

  @override
  Widget build(BuildContext context) {
    dat = dat.isNotEmpty? dat: ModalRoute.of(context)?.settings.arguments as Map;
    String image = dat['dayTime']?'day.png':'night.png';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$image'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      dat= {
                        'time': result['time'],
                        'location': result['location'],
                        'dayTime': result['dayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
              ),
                  label: Text(
                    'Change location',
                    style: TextStyle(
                      color: Colors.grey[300],
                  ),
                )
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    dat['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:28,
                      letterSpacing: 2,
                    )
                  ),
                ]
              ),
              SizedBox(height:20),
              Text(
                dat['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 66,
                )
              ),
            ]
          ),
      ),
        ),
      )
    );
  }
}
