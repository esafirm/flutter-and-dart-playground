import '../api_requester.dart' as api;
import '../store/heroes_store.dart' as store;
import 'package:app/heroes/superhero.dart';

Future<List<SuperHero>> fetchHeroes() async {
  var localData = await store.getHeroes();
  if (localData != null) {
    return _jsonToHeroes(localData as List<dynamic>);
  }

  return api.fetchHeroes().then((result) => result['results']).then((jsonArray) {
    store.saveHeroes(jsonArray);
    return _jsonToHeroes(jsonArray);
  });
}

List<SuperHero> _jsonToHeroes(List<dynamic> jsonArray) {
  return jsonArray.map((i) => new SuperHero.fromJson(i)).toList();
}
