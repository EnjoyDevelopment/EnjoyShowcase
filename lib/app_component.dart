
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Application.dart';
import 'helper/localisation/translations_delegate.dart';
import 'helper/routes_config/routes.dart';
import 'ui/common/themes/theme_configuration.dart';
import 'ui/profile_screen/developer_details_animator.dart';
import 'ui/splash_screen/splash_screen.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return new AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new SplashScreen(),
        title: "Enjoy Showcase",
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English
          const Locale('fr', ''), // French
        ],
        theme: ThemeConfiguration.themeData(Theme.of(context).platform),
        onGenerateRoute: Application.router.generator);
  }
}
