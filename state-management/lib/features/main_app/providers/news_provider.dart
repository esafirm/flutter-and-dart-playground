import 'package:clean_archetructure/core/classes/http_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../config/api_endpoints.dart';
import '../../../config/app_http.dart';
import '../models/model.dart';

class NewsProvider extends ChangeNotifier {
  final HttpManager _http = Http.newsClient();
  NewsResponseModel? _nrm;
  bool isLoading = false;

  NewsResponseModel get newsResponse => _nrm!;

  void search(String searchTerm) async {
    isLoading = false;
    notifyListeners();

    Response res = await _http.get(ApiEndpoint.news, params: {'q': searchTerm, 'lang': 'en'});
    if (res.statusCode == 200 && res.statusCode != 429) {
      // print(res);
      _nrm = NewsResponseModel.fromJson(res.toString());
      isLoading = true;
      notifyListeners();
    }
  }
}
