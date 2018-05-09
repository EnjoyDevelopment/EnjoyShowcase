import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

import '../../Application.dart';
import '../../helper/routes_config/routes.dart';
import '../common/components/page_transformer.dart';
import 'intro_item.dart';

class IntroPageItem extends StatelessWidget {
  IntroPageItem({
    @required this.item,
    @required this.pageVisibility,
  });

  final IntroItem item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return new Opacity(
      opacity: pageVisibility.visibleFraction,
      child: new Transform(
        alignment: FractionalOffset.topLeft,
        transform: new Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: new Text(
        item.category,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 14.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

    final titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: new Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Text(
          item.title,
          style: textTheme.title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return new Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          categoryText,
          titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = new Image.asset(
      item.imageUrl,
      fit: BoxFit.cover,
      alignment: new FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );

    return new Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: new Material(
        elevation: 4.0,
        borderRadius: new BorderRadius.circular(8.0),
        child: item.pageNumber != 6
            ? pageStack(context, image)
            : lastPageStack(context),
      ),
    );
  }

  Widget pageStack(BuildContext context, Image image) {
    return new Stack(
      fit: StackFit.expand,
      children: [
        image,
        //  overlayGradient(),
        _buildTextContainer(context),
      ],
    );
  }

  Widget lastPageStack(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.topCenter,
      fit: StackFit.loose,
      children: [
        _continueTextContainer(),
        submitButton(context),
      ],
    );
  }

  Widget _continueTextContainer() {
    return new Container(
      margin: new EdgeInsets.only(top: 130.0),
      child: new Text(
        "Now I'll introduce you to the team...",
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
            fontFamily: 'anton',
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return new InkWell(
      onTap: () => onSubmit(context),
      child: new Container(
        width: 170.0,
        height: 40.0,
        alignment: FractionalOffset.center,
        margin: new EdgeInsets.only(top: 180.0),
        decoration: new BoxDecoration(
          color: new Color(0xFFf7406a),
          borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
        ),
        child: new Text(
          "Continue",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'jose',
            letterSpacing: 0.0,
          ),
        ),
      ),
    );
  }

  void onSubmit(BuildContext context) {
    Application.router.navigateTo(context, Routes.enterProfileScreen,
        transition: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 500));
  }

  Widget overlayGradient() {
    return new DecoratedBox(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );
  }
}
