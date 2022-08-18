import 'package:clean_archetructure/core/classes/route_manager.dart';
import 'package:clean_archetructure/features/covid_countries/covid_countries_screen.dart';

class CovidCountriesRoute extends RouteManager {
  CovidCountriesRoute() {
    addRoute("/covid/countries/", (context) => const CovidCountriesScreen());
  }
}
