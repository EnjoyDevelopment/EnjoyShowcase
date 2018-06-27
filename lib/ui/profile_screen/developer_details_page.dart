import 'dart:collection';
import 'dart:ui' as ui;
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../Application.dart';
import '../../data/model/profiles/developer.dart';
import 'developer_details_enter_animation.dart';

enum DeveloperEnum { paul, jon, ben, ross }

class DeveloperDetailsPage extends StatelessWidget {
  DeveloperDetailsPage({
    @required this.developer,
    @required AnimationController controller,
  }) : animation = new DeveloperDetailsEnterAnimation(controller);

  Developer developer;
  final DeveloperDetailsEnterAnimation animation;
  var developers = new LinkedHashMap();

  void _handleDragEnd(DragEndDetails dragDetails) {
    if (-dragDetails.velocity.pixelsPerSecond.dx > 700) {
      _navigateToNextDeveloper(nextDeveloper(developer.developerEnumIndex, true));
    } else if (dragDetails.velocity.pixelsPerSecond.dx > 700) {
      _navigateToNextDeveloper(nextDeveloper(developer.developerEnumIndex, false));
    }
  }

  void _navigateToNextDeveloper(String developerName) {
    Application.router.navigateTo(
        context1, "/enterProfileScreen?developername=$developerName",
        transition: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 500));
  }

  String nextDeveloper(int  developerEnumIndex, bool isForward) {

    developers[0] = DeveloperEnum.paul.toString();
    developers[1] = DeveloperEnum.jon.toString();
    developers[2] = DeveloperEnum.ben.toString();
    developers[3] = DeveloperEnum.ross.toString();

    if (isForward) {
      return developers[ developerEnumIndex + 1];
    } else {
      return developers[ developerEnumIndex - 1];
    }
  }

  static BuildContext context1;
  Widget _buildAnimation(BuildContext context, Widget child) {
    context1 = context;
    return new GestureDetector(
      onHorizontalDragEnd: _handleDragEnd,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Opacity(
            opacity: animation.backdropOpacity.value,
            child: new Image.asset(
              developer.backdropPhoto,
              fit: BoxFit.cover,
            ),
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: animation.backdropBlur.value,
              sigmaY: animation.backdropBlur.value,
            ),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return new SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          // _buildVideoScroller(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return new Transform(
      transform: new Matrix4.diagonal3Values(
        animation.avatarSize.value,
        animation.avatarSize.value,
        1.0,
      ),
      alignment: Alignment.center,
      child: new Container(
        width: 110.0,
        height: 110.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.white30),
        ),
        margin: const EdgeInsets.only(top: 32.0, left: 16.0),
        padding: const EdgeInsets.all(3.0),
        child: new ClipOval(
          child: new Image.asset(developer.avatar),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            developer.firstName + '\n' + developer.lastName,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          new Text(
            developer.location,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.locationOpacity.value),
              fontWeight: FontWeight.w500,
            ),
          ),
          new Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          new Text(
            developer.biography,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.biographyOpacity.value),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new AnimatedBuilder(
        animation: animation.controller,
        builder: _buildAnimation,
      ),
    );
  }
}
