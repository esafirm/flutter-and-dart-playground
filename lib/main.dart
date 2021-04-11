import 'package:app/heroes/main.dart';
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

typedef Navigation = Widget Function();

class Menu {
  String name;
  Navigation navigation;

  Menu({this.name, this.navigation});
}

List<Menu> menus = [
  Menu(name: 'Alarm Screen', navigation: () => CreateAlarmScreen()),
  Menu(name: 'Canvas Draw', navigation: () => DrawScreen()),
  Menu(name: 'Heroes List', navigation: () => HeroesPage())
];

class MenuPage extends StatelessWidget {
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
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menus[index].name),
            onTap: () {
              _navigate(context, menus[index].navigation());
            },
          );
        },
      ).build(context),
    );
  }
}
