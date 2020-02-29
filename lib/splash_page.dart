import 'package:app_login_affiliate/const.dart';
import 'package:app_login_affiliate/login_page.dart';
import 'package:app_login_affiliate/widgets/main_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PageController _pageController = PageController();
  var width, height;
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page.round();
      });
    });

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
          Hero(
            tag: 'main-clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Material(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    _buildContent(),
                    _buildContent(),
                    _buildContent(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: SliderIndicator(
                length: 3,
                activeIndex: currentPage,
                indicator: Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: CColors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                activeIndicator: Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: CColors.white),
                    color: CColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          )
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
