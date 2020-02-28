import 'package:flutter/material.dart';

class MainClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double radius = 60;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - radius * 2);
    path.quadraticBezierTo(
        0, size.height - radius, radius, size.height - radius);
    path.lineTo(size.width - radius, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height - radius, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
