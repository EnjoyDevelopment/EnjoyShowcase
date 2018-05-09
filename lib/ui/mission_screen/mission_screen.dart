import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import '../../Application.dart';
import '../../helper/routes_config/routes.dart';
import '../common/components/page_transformer.dart';
import 'intro_item.dart';
import 'mission_screen_item.dart';

class IntroPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      body: new Container(
        width: _screenWidth,
        height: _screenHeight,
        color: Colors.white,
        margin: new EdgeInsets.only(top: 23.0),
        child: _pageTransformer(),
      ),
    );
  }

  Widget _pageTransformer() {
    return new PageTransformer(
      pageViewBuilder: (context, visibilityResolver) {
        return new PageView.builder(
          controller: new PageController(viewportFraction: 1.0),
          itemCount: sampleItems.length,
          itemBuilder: (context, index) {
            final item = sampleItems[index];
            final pageVisibility =
                visibilityResolver.resolvePageVisibility(index);
            return new IntroPageItem(
              item: item,
              pageVisibility: pageVisibility,
            );
          },
        );
      },
    );
  }
}
