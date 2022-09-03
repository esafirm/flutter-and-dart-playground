import 'package:clean_archetructure/features/covid_countries/covid_countries_route.dart';
import 'package:clean_archetructure/features/covid_detail/covid_detail_route.dart';
import 'package:clean_archetructure/features/covid_home/covid_home_route.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter _router = GoRouter(
    routes: [covidHomeRoute, covidCountriesRoute, covideDetailRoute],
  );

  static GoRouter get router => _router;

  static void setup() {
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  }
}
