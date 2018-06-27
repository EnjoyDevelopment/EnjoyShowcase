import 'package:flutter/material.dart';

import '../../data/model/profiles/developer.dart';
import '../../data/model/profiles/developer_data.dart';
import 'developer_details_page.dart';

//enum DeveloperName { Paul, Jon, Ben, Ross }

class DeveloperDetailsAnimator extends StatefulWidget {
  String _developerName;
  DeveloperDetailsAnimator(this._developerName);

  @override
  _DeveloperDetailsAnimator createState() =>
      new _DeveloperDetailsAnimator(_developerName);
}

class _DeveloperDetailsAnimator extends State<DeveloperDetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String _developerName;
  _DeveloperDetailsAnimator(this._developerName);

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
    Developer developer;

    switch (_developerName) {
      case "Paul":
        {
          developer = DeveloperData.paul;
          break;
        }

      case "Jon":
        {
          developer = DeveloperData.jon;
          break;
        }

      case "Ben":
        {
          developer = DeveloperData.ben;
          break;
        }

      case "Ross":
        {
          developer = DeveloperData.jon;
          break;
        }
    }

    return new DeveloperDetailsPage(
      developer: developer,
      controller: _controller,
    );
  }
}
