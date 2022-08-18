import 'package:clean_archetructure/features/covid_home/data/covid_client.dart';
import 'package:flutter/foundation.dart';

import 'package:clean_archetructure/config/app_http.dart';

import 'case_model.dart';

class CaseProvider extends ChangeNotifier {
  final CovidClient _client = CovidClient(Http.covideClient());
  Case? _caseResponse;

  bool isLoading = false;
  String get totalConfirmed => _caseResponse?.global.totalConfirmed.toString() ?? '...';
  String get totalDeaths => _caseResponse?.global.totalDeaths.toString() ?? '...';
  List<Countries> get countries => _caseResponse?.countries ?? List.empty();

  Countries? getCountryByName(String name) {
    return _caseResponse?.countries.firstWhere((element) => element.country == name);
  }

  void load() async {
    isLoading = true;
    notifyListeners();

    _caseResponse = await _client.getCase();
    isLoading = false;
    notifyListeners();
  }
}
