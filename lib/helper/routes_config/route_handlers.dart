
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../ui/enter_name_screen/enter_name_screen.dart';
import '../../ui/journey_text_screen/journey_text_screen.dart';
import '../../ui/mission_screen/mission_screen.dart';
import '../../ui/profile_screen/developer_details_animator.dart';


var enterHomeScreenHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new EnterNameScreen();
});

var enterJourneyTextScreenHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new JourneyTextScreen();
  });

var enterIntroScreenHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new  IntroPageView();
  });


var enterProfileScreenHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new  DeveloperDetailsAnimator(DeveloperName.Paul);
  });


