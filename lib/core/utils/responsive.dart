import 'package:flutter/material.dart';

class Responsive {
  final BoxConstraints constraints;

  Responsive(this.constraints);

  double height(double designHeight) =>
      (designHeight / 844) * constraints.maxHeight;

  double width(double designWidth) =>
      (designWidth / 390) * constraints.maxWidth;
}
