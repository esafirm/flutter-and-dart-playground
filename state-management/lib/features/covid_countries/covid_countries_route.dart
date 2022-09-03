import 'package:clean_archetructure/features/covid_countries/covid_countries_screen.dart';
import 'package:go_router/go_router.dart';

final covidCountriesRoute =
    GoRoute(path: '/countries', builder: (context, state) => const CovidCountriesScreen());
