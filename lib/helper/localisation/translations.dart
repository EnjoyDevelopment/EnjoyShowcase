import 'package:flutter/material.dart';

class Translations {
  Translations(this.locale);

  Locale locale;
  bool overrideLocale = false;
  Locale overideLocale = new Locale("fr");

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      TranslationKey.APP_BAR_TITLE: "Enjoy Work",
      TranslationKey.HAPPY_STATE_LABEL:"That's great ! Why do you feel like that?",
      TranslationKey.NORMAL_STATE_LABEL :"That's okay, why do you feel like that?",
      TranslationKey.SAD_STATE_LABEL :"That's sad, why do you feel like that?",
      TranslationKey.ASK_STATE_LABEL:'How are you today ?',
      TranslationKey.SUBMIT_ANSWER_BTN_LABEL:"submit answer"

    },
    'fr': {
      TranslationKey.APP_BAR_TITLE: 'Profitez du travail',
      TranslationKey.HAPPY_STATE_LABEL:"C'est génial ! Pourquoi te sens-tu comme ça?",
      TranslationKey.NORMAL_STATE_LABEL :"C'est bon, pourquoi te sens-tu comme ça?",
      TranslationKey.SAD_STATE_LABEL :"C'est triste, pourquoi te sens-tu comme ça?",
      TranslationKey.ASK_STATE_LABEL:'Comment vas-tu aujourd\'hui ?',
      TranslationKey.SUBMIT_ANSWER_BTN_LABEL:"soumettre une réponse"
    }
  };

  String text(String key) {
    if (overrideLocale) locale = overideLocale;
    return _localizedValues[locale.languageCode][key] ?? '** ${key} not found';
  }
}

class TranslationKey {
  static const String APP_BAR_TITLE = "appBarTitle";
  static const String HAPPY_STATE_LABEL = "happyStateLabel";
  static const String NORMAL_STATE_LABEL = "normalStateLabel";
  static const String SAD_STATE_LABEL = "sadStateLabel";
  static const String ASK_STATE_LABEL = "askStateLabel";
  static const String SUBMIT_ANSWER_BTN_LABEL = "submitAnswerBtnLabel";

}
