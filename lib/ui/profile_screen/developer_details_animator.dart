import 'package:flutter/material.dart';

import '../../data/model/profiles/developer_paul.dart';
import 'developer_details_page.dart';

enum DeveloperName{
  Paul,
  Jon,
  Ben

}

class DeveloperDetailsAnimator extends StatefulWidget {

  DeveloperName _developerName;
  DeveloperDetailsAnimator(this._developerName);


  @override
  _DeveloperDetailsAnimator createState() => new _DeveloperDetailsAnimator();
}

class _DeveloperDetailsAnimator extends State<DeveloperDetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DeveloperDetailsPage(
      artist: DeveloperPaul.paul,
      controller: _controller,
    );
  }
}
