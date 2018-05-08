
import 'package:flutter/material.dart';

import '../../helper/localisation/translations.dart';
 

class AppBarComponent {
  BuildContext _context;

  AppBarComponent(this._context);

  Widget getComponent() {
    return new AppBar(
        centerTitle: true,
        //title: new Text(
           // Translations.of(_context).text(TranslationKey.APP_BAR_TITLE),
          //  textAlign: TextAlign.center,
           // style: ThemeConfiguration
               // .appBarTextStyle(Theme.of(_context).platform)),
        elevation: 18.0);
  }
}
