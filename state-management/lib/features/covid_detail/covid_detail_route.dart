import 'package:clean_archetructure/core/classes/route_manager.dart';
import 'package:clean_archetructure/features/covid_detail/covid_detail_screen.dart';

class CovidDetailRoute extends RouteManager {
  CovidDetailRoute() {
    addRoute("/covid/countries/detail", (context) => const CovidDetailScreen());
  }
}
