import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const _KEY = 'Store.Heroes';

saveHeroes(List<dynamic> items) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(_KEY, json.encode(items));
}

getHeroes() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String rawJson = prefs.getString(_KEY);
  return rawJson == null ? null : json.decode(rawJson).toList();
}
