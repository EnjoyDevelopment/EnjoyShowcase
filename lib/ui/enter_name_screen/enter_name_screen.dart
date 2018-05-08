import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Application.dart';
import '../../helper/routes_config/routes.dart';

class EnterNameScreen extends StatefulWidget {
  @override
  State createState() => new EnterNameScreenState();
}

class EnterNameScreenState extends State<EnterNameScreen> {
  // FocusNode _textFieldFocusNode;
  TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    //   _textFieldFocusNode = new FocusNode();
    _inputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {




   
    //if (_inputController == null || _inputController.text == "") {
    // FocusScope.of(context).requestFocus(_textFieldFocusNode);
    // } else {
    //todo need a sexy button to appera fo r teh on ubmit
    // }


    return new Scaffold(

      body: _buildBody(),
    );
  }

 var _submitBtnColour = new Color(0x26f7406a);
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
            margin: new EdgeInsets.only(top: 130.0, left: 25.0),
            width: MediaQuery.of(context).size.width,
            child: new Text(
              "Enter your name.",
              textAlign: TextAlign.left,
              style: new TextStyle(
                  fontSize: 18.0,
                  color:  Colors.black54,
                  fontWeight: FontWeight.w400 , fontFamily: 'anton'),
            )),
        new Container(
          margin: new EdgeInsets.only(left: 25.0, right: 25.0, top: 7.0),
          child: new TextField( 
             
            controller: _inputController,
             onChanged:(str){
               setState((){

                  if(str == null || str.isEmpty){
                    _submitBtnColour = new Color(0x26f7406a);
                    _canSubmitName = false;
                  }else{
                     _submitBtnColour = new Color(0xFFf7406a);
                    _canSubmitName = true;
                  }
               });
             } ,
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.create),
                isDense: true,
              contentPadding: new EdgeInsets.only(
              left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
          
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(7.0)),
            ),
            style: new TextStyle(fontSize: 14.0, color: Colors.black54 , fontWeight: FontWeight.w300),
          ),
        ),
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
          "Submit",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,fontFamily: 'jose',
            letterSpacing: 0.0,
          ),
        ),
    ),
    );
  }


  void onSubmit() {
    if(_canSubmitName){
      Application.router.navigateTo(context,Routes.enterJourneyTextScreen , transition:  TransitionType.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000));
        
    }
  }
}
