import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ColorState{
  Color colors =Colors.black12;
  ColorState({required this.colors});
}

class ColorInitialState extends ColorState{
  ColorInitialState():super(colors: Colors.black12);
}
class ColorIncrementState extends ColorState{
  ColorIncrementState(Color increasedColor):super(colors: increasedColor);
}
class ColorDecrementState extends ColorState{
  ColorDecrementState(Color decreasedColor):super(colors: decreasedColor);
}