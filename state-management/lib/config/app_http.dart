import 'package:clean_archetructure/core/classes/http_manager.dart';
import 'package:clean_archetructure/config/api_endpoints.dart';
import 'package:clean_archetructure/config/app_config.dart';

class Http {
  static newsClient() => HttpManager(ApiEndpoint.baseUrl, {
        'x-rapidapi-key': Config.host,
        'x-rapidapi-host': Config.key,
      });

  static covideClient() => HttpManager(ApiEndpoint.covideBaseUrl);
}
