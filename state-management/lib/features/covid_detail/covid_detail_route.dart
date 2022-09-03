import 'package:clean_archetructure/features/covid_detail/covid_detail_screen.dart';
import 'package:go_router/go_router.dart';

final covideDetailRoute = GoRoute(
    path: '/countries/:name',
    builder: (context, state) {
      final String countryName = state.params['name'] as String;
      return CovidDetailScreen(countryName: countryName);
    });
