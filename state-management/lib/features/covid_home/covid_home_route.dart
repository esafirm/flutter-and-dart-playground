import 'package:clean_archetructure/core/classes/route_manager.dart';
import 'package:clean_archetructure/features/covid_home/covid_home_screen.dart';
import 'package:go_router/go_router.dart';

final covidHomeRoute = GoRoute(path: '/', builder: (context, state) => const CovidHomeScreen());
