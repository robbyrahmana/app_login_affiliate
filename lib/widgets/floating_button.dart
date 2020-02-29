import 'package:app_login_affiliate/const.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingButton extends StatefulWidget {
  final AnimationController parentController;
  FloatingButton({this.parentController});
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _scale;
  Animation<double> _padding;
  Animation<double> _opacity;

  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _scale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: widget.parentController,
        curve: Interval(0, .5, curve: Curves.bounceOut),
      ),
    )..addListener(() {
        setState(() {});
      });
    _padding = Tween<double>(begin: 0, end: 65).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1, curve: Curves.easeIn),
      ),
    )..addListener(() {
        setState(() {});
      });
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, .2, curve: Curves.easeIn),
      ),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        controller.value < 0.5
            ? Container()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: CColors.black.withAlpha(
                  (150 * _opacity.value).round(),
                ),
              ),
        _smallIcon(math.pi / 5, FontAwesomeIcons.google),
        _smallIcon(-math.pi / 5, FontAwesomeIcons.plus),
        _smallIcon(0, FontAwesomeIcons.facebookF),
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.scale(
            scale: _scale.value,
            child: FloatingActionButton(
              backgroundColor:
                  controller.value < 0.5 ? CColors.blue : CColors.red,
              onPressed: () {
                if (controller.value == 0.0) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: controller,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _smallIcon(double angle, IconData icon) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.rotate(
        angle: angle,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: _padding.value,
          ),
          child: Transform.rotate(
            angle: -angle,
            child: Opacity(
              opacity: _opacity.value,
              child: FloatingActionButton(
                elevation: 0,
                heroTag: angle.toString(),
                mini: true,
                backgroundColor: CColors.lightblack,
                child: Icon(
                  icon,
                  color: CColors.white,
                  size: 16,
                ),
                onPressed: () {
                  print(angle);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
