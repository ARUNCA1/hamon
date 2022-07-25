import 'package:flutter/material.dart';

class Constants {
  late BuildContext context;
  Constants(this.context);

  double get scrnWidth => MediaQuery.of(context).size.width;
  double get scrnHeight => MediaQuery.of(context).size.height;

 }