import 'package:clean_archetructure/features/covid_home/data/covid_client.dart';
import 'package:flutter/foundation.dart';

import 'package:clean_archetructure/config/app_http.dart';

import 'case_model.dart';

class CaseProvider extends ChangeNotifier {
  final CovidClient _client = CovidClient(Http.convidClient());
  Case? _caseResponse;

  bool isLoading = false;
  String get totalConfirmed => _caseResponse?.global.totalConfirmed.toString() ?? '...';
  String get totalDeaths => _caseResponse?.global.totalDeaths.toString() ?? '...';

  void load() async {
    isLoading = true;
    notifyListeners();

    _caseResponse = await _client.getCase();
    isLoading = false;
    notifyListeners();
  }
}
