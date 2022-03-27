import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked_demo/common/locator.dart';
import 'package:stacked_demo/common/router.gr.dart' as manageroutes;
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[700],
        accentColor: Colors.yellow[700],
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.blue[300],
        accentColor: Colors.yellow[300]
      ),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        navigatorKey: StackedService.navigatorKey,
        initialRoute: manageroutes.Routes.homeView,
        onGenerateRoute: manageroutes.Router().onGenerateRoute,
      )
    );
  }
}