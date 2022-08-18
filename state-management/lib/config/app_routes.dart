import 'package:clean_archetructure/features/covid_countries/covid_home_route.dart';
import 'package:clean_archetructure/features/covid_detail/covid_detail_route.dart';
import 'package:clean_archetructure/features/covid_home/covid_home_route.dart';

import '../core/classes/route_manager.dart';

class Routes extends RouteManager {
  Routes() {
    addAll(CovideHomeRoute().routes);
    addAll(CovidCountriesRoute().routes);
    addAll(CovidDetailRoute().routes);
  }
}
