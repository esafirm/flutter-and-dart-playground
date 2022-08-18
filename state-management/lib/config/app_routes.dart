import 'package:clean_archetructure/features/covid_home/covid_home_route.dart';

import '../core/classes/route_manager.dart';

class Routes extends RouteManager {
  Routes() {
    addAll(CovideHomeRoute().routes);
    // addAll(AuthApp().routes);
    // addAll(App().routes);
    // addAll(FeatureApp().routes);
  }
}
