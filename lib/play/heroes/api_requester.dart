import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final baseUrl = "https://comicvine.gamespot.com/api/";
final apiKey = "5a057d92180cb2d18219631a905004cc6c518837";

Uri _formatUrl(String endPoint) => Uri.parse("$baseUrl$endPoint?api_key=$apiKey&format=json");

Future<Map> _decode(Future<http.Response> f) => f.then((r) => (json.decode(r.body)));

Future<Map> _request(String endpoint) {
  _preRequest(endpoint);
  final url = _formatUrl(endpoint);
  final res = http.get(url, headers: {"Accept": "application/json", "Access-Control-Allow-Origin": "*"});
  return _decode(res);
}

void _preRequest(String endpoint) {
  print("Requesting $endpoint");
  print("The url is ${_formatUrl(endpoint)}");
}

Future<Map> fetchHeroes() => _request("characters");
