import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../Application.dart';
import '../base/presenter_factory_producer.dart';
import 'splash_screen_presenter.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin
    implements SplashScreenContract {
  AnimationController _animationController;

  get screenHeight => null;
  SplashScreenPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    _presenter =
        PresenterFactoryProducer.getPresenter(ViewType.splashScreen, this);
    _presenter.initTimer();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return new Container(
      decoration: new BoxDecoration(
       // gradient: new LinearGradient(
        //  colors: [const Color(0xFFffffff), const Color(0xFFA9B2BC)],
        //  begin: const FractionalOffset(0.0, 0.0),
        //  end: const FractionalOffset(1.0, 1.0),
          //stops: [0.0, 1.0],
          //  tileMode: TileMode.clamp
       //),

            image: new DecorationImage(
            image: new AssetImage("assets/images/enjoy.png"),
            fit: BoxFit.cover,
            ),
      ),
      margin: const EdgeInsets.only(top: 20.0),
      child: new AnimatedObject(
          controller: _animationController,
          screenHeight: _screenHeight,
          screenWidth: _screenWidth),
    );
  }

  Future _startAnimation() async {
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {
      print("anim failed");
    }
  }

  @override
  dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  void onStartSplashScreen() {
    _startAnimation();
  }

  @override
  void onEndSplashScreen() {
   // NavigationManager.navigate(context, NavigationManager.enterNamePageRoute);
   //Router router = new Router();

   Application.router.navigateTo(context, '/enterNameScreen' , transition:  TransitionType.fadeIn,
   transitionDuration: const Duration(milliseconds: 1000));
     /// Navigator.pushReplacementNamed(context, 'enterNameScreen'  );
  }
}


class AnimatedObject extends StatelessWidget {
  final Animation<double> controller;
  final Animation<EdgeInsets> movement;

  final Animation<double> underlineWidth;

  final Animation<double> enjoyOpacity;
  final Animation<double> enjoyDevelopment;

  final double screenHeight;
  final double screenWidth;

  AnimatedObject(
      {Key key, this.controller, this.screenHeight, this.screenWidth})
      : movement = EdgeInsetsTween(
          begin: new EdgeInsets.only(top: 0.0, left: 0.0),
          end: new EdgeInsets.only(top: screenHeight / 10, left: 0.0),
        ).animate(CurvedAnimation(
          parent: controller,
          curve: new Interval(0.0, 0.8, curve: Curves.bounceOut),
        )),
        underlineWidth = Tween<double>(begin: 0.0, end: screenWidth - 150)
            .animate(CurvedAnimation(
          parent: controller,
          curve: new Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        )),
        enjoyOpacity =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: new Interval(0.1, 0.9, curve: Curves.fastOutSlowIn),
        )),
        enjoyDevelopment =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: new Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
        )),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return buildAnimationColumn();
        });
  }

  Widget buildAnimationColumn() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        firstSectionText(),
        secondSectionText(),
        secondSectionUnderline()
      ],
    );
  }

  Widget firstSectionText() {
    return new Opacity(
      opacity: enjoyOpacity.value,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: movement.value,
            child: new Container(
              child: new Text(
                "Enjoy",
                style: new TextStyle(
                  fontSize: 50.0,
                  fontFamily: "jose",
                  color: Colors.black
                ),
              ),
            ),
          ),
          new Opacity(
            opacity: enjoyDevelopment.value,
            child: new Container(
              padding: movement.value,
              child: new Container(
                child: new Text(
                  ".",
                  style: new TextStyle(
                    fontSize: 50.0,
                    fontFamily: "jose",
                    color:  new Color(0xFFf7406a)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondSectionText() {
    return new Opacity(
      opacity: enjoyDevelopment.value,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 2.0),
            child: new Container(
              child: new Text(
                "Development",
                style: new TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                   //fontWeight:  FontWeight.w800,
                       fontFamily: "anton",
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }

  Widget secondSectionUnderline() {
    return new Container(
      padding: const EdgeInsets.only(top: 2.0),
      // alignment: Alignment.center,
      child: new Container(
        width: underlineWidth.value, //screenWidth - 80.0,
        height: 1.0,
        //  padding: movement.value,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(width: 1.0, color: new Color(0xFFf7406a)),
        ),
      ),
    );
  }
}
