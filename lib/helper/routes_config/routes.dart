
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {

  static String root = "/";
  static String enterHomeScreen = "/enterNameScreen";
  static String enterJourneyTextScreen = "/enterJourneyTextScreen";
  static String enterIntroScreen = "/enterIntroScreen";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(enterHomeScreen, handler: enterHomeScreenHandler);
    router.define(enterJourneyTextScreen, handler: enterJourneyTextScreenHandler);
    router.define(enterIntroScreen, handler: enterIntroScreenHandler);
  }
}



