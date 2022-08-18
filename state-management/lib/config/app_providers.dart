import 'package:clean_archetructure/features/covid_home/data/case_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/classes/global_state_manager.dart';
import '../features/main_app/providers/news_provider.dart';
import 'app_theme.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<ThemeProvider>(
    create: (context) => ThemeProvider(),
  ),
  ChangeNotifierProvider<GlobalStateManager>(
    create: (context) => GlobalStateManager(),
  ),
  ChangeNotifierProvider<NewsProvider>(
    create: (context) => NewsProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => CaseProvider(),
  )
];
