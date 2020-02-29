import 'package:app_login_affiliate/const.dart';
import 'package:app_login_affiliate/widgets/floating_button.dart';
import 'package:app_login_affiliate/widgets/input_widget.dart';
import 'package:app_login_affiliate/widgets/main_clipper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  var width, height;
  AnimationController controller;
  Animation<double> _position;
  Animation<double> _opacity;
  Animation<double> _position2;
  Animation<double> _opacity2;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _position = Tween<double>(begin: 60, end: 40).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, .8, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {});
      });
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, .3, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {});
      });
    _position2 = Tween<double>(begin: 90, end: 70).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 1, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {});
      });
    _opacity2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0, .5, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingButton(parentController: controller),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: <Widget>[
          Container(
            color: CColors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
              child: Container(
                padding: EdgeInsets.only(top: height * .55 - 60),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Login To Your Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: CColors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 24),
                    InputWidget(
                      placeholder: "Username",
                      icon: Icons.person,
                    ),
                    SizedBox(height: 12),
                    InputWidget(
                      placeholder: "Password",
                      icon: Icons.lock,
                      secret: true,
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            color: CColors.darkblack,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            height: 50,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Sign In",
                                  style: TextStyle(color: CColors.white),
                                ),
                                SizedBox(width: 32),
                                Icon(Icons.arrow_forward,
                                    size: 12, color: CColors.white),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            height: 50,
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: CColors.white.withAlpha(75),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: 'main-clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Container(
                height: height * .55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    CColors.lightblue,
                    CColors.blue,
                    CColors.darkblue,
                  ], begin: Alignment.topLeft, end: Alignment.centerRight),
                ),
                child: Image.asset("assets/logo.png", width: width * .6),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _position.value),
            child: Opacity(
              opacity: _opacity.value,
              child: Container(
                width: double.infinity,
                child: Text(
                  "Welcome to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: CColors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _position2.value),
            child: Opacity(
              opacity: _opacity2.value,
              child: Container(
                width: double.infinity,
                child: Text(
                  "Affiliate System",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: CColors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
