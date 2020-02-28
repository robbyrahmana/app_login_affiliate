import 'package:app_login_affiliate/const.dart';
import 'package:app_login_affiliate/login_page.dart';
import 'package:app_login_affiliate/widgets/main_clipper.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: CColors.black,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Hero(
                    tag: 'login-text',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        "Login To Your Account",
                        style: TextStyle(
                          fontSize: 20,
                          color: CColors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Hero(
            tag: 'main-clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Material(
                child: PageView(
                  children: <Widget>[
                    _buildContent(),
                    _buildContent(),
                    _buildContent(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          CColors.lightblue,
          CColors.blue,
          CColors.darkblue,
        ], begin: Alignment.topLeft, end: Alignment.centerRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/logo.png", width: width * .9),
          SizedBox(height: 32),
          Text(
            "We Care About\nYour Profit",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: CColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "We connect publishers and adverbtisers\nand providers an easy-to-use infrastructure\nfor maximum profit.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
