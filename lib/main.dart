import 'package:flutter/material.dart';
import 'create_alarm.dart';
import 'canvas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuPage(),
    );
  }
}

const MENUS = ['Alarm Screen', 'Canvas Draw'];

class MenuPage extends StatelessWidget {
  _onMenuClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        _navigate(context, CreateAlarmScreen());
        break;
      case 1:
        _navigate(context, DrawScreen());
        break;
      default:
    }
  }

  _navigate(BuildContext context, Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Playground'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (context, index) => Divider(),
        itemCount: MENUS.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(MENUS[index]),
            onTap: () {
              _onMenuClick(context, index);
            },
          );
        },
      ).build(context),
    );
  }
}
