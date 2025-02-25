import 'package:flutter/material.dart';

class MyCarveEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, size.height);
    final firstPoint =  Offset(0, size.height-20);
    final secondPoint =  Offset(30, size.height-20);
    path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);
     final stateLineFirst =  Offset(0, size.height-20);
    final stateLineSecond =  Offset(size.width-30, size.height-20);
     path.quadraticBezierTo(stateLineFirst.dx, stateLineFirst.dy, stateLineSecond.dx, stateLineSecond.dy);
     final firstPointSecond =  Offset(size.width, size.height-20);
    final secondPointSecond =  Offset(size.width, size.height);
    
    path.quadraticBezierTo(firstPointSecond.dx, firstPointSecond.dy, secondPointSecond.dx, secondPointSecond.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }


}