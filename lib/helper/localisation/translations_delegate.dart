import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'translations.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    return new SynchronousFuture<Translations>(new Translations(locale));
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
