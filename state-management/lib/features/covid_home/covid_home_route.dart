import 'package:clean_archetructure/core/classes/route_manager.dart';
import 'package:clean_archetructure/features/covid_home/covid_home_screen.dart';

class CovideHomeRoute extends RouteManager {
  CovideHomeRoute() {
    addRoute("/covid/home", (context) => const CovidHomeScreen());
  }
}
