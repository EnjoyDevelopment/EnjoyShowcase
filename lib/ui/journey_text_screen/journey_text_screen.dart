import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Application.dart';
import '../../helper/routes_config/routes.dart';

class JourneyTextScreen extends StatefulWidget {
  @override
  State createState() => new JourneyTextScreenState();
}

class JourneyTextScreenState extends State<JourneyTextScreen> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {



    return new Scaffold(

      body: _buildBody(),
    );
  }

 var _submitBtnColour = new Color(0xFFf7406a);
 var _canSubmitName = false;

  Widget _buildBody() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [const Color(0xFFffffff), const Color(0xFF000000)],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 8.0),
          stops: [0.0, 1.0],
        ),
      ),
      child: new Column(children: <Widget>[
        new Container(
            margin: new EdgeInsets.only(top: 130.0, left: 25.0 , right: 25.0),
            width: MediaQuery.of(context).size.width,
            child: new Text(
              "Hi Tim. Nice to meet you. Let me take you on a tour of Enjoy Development.",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: 'anton',
                  fontWeight: FontWeight.w400 ),
            )),
   
        submitButton(),
      ]),
    );
  }

  Widget submitButton() {

    return new InkWell(
    onTap: ()=>onSubmit(),
      

    child:new Container(
      width: 170.0,
      height: 40.0,
      alignment: FractionalOffset.center,
      margin: new EdgeInsets.only(top: 40.0),
      decoration: new BoxDecoration(
        color:    _submitBtnColour ,
        // color: Colors.pink[200],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),

        child: new Text(
          "Okay",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'jose',
            letterSpacing: 0.0,
          ),
        ),
    ),
    );
  }


  void onSubmit() {
    //if(_canSubmitName){
      Application.router.navigateTo(context,Routes.enterIntroScreen , transition:  TransitionType.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000));
        
   // }
  }
}
