import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/util/style/colors.dart';

void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
void NavigatePop({context})=>  Navigator.pop(context);
Future NavigateAndFinsh ({context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);


var myNewFont = TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w400);
var myFontStyle = TextStyle(color: Colors.white, letterSpacing: 3);


