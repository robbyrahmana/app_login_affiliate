import 'package:app_login_affiliate/const.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final bool secret;

  const InputWidget({
    Key key,
    this.placeholder,
    this.icon,
    this.secret = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CColors.lightblack,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      height: 50,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              icon,
              color: CColors.white.withAlpha(75),
            ),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: CColors.black,
          ),
          Expanded(
            child: TextField(
              obscureText: secret,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                hintText: "$placeholder",
                hintStyle: TextStyle(
                  color: CColors.white.withAlpha(75),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (secret) ...[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.remove_red_eye,
                color: CColors.white.withAlpha(75),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
