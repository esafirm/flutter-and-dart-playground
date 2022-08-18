import 'dart:convert';
import 'package:clean_archetructure/core/classes/http_manager.dart';
import 'package:dio/dio.dart';
import 'case_model.dart';

class CovidClient {
  final HttpManager _http;

  CovidClient(this._http);

  Future<Case> getCase() async {
    Response res = await _http.get("summary");
    final statusCode = res.statusCode ?? 500;
    if (statusCode < 400) {
      return Future.value(Case.fromJson(json.decode(res.toString())));
    }
    return Future.error(res.toString());
  }
}
