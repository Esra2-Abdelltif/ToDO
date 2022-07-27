import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_algoriza/util/style/colors.dart';

void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
void NavigatePop({context})=>  Navigator.pop(context);
Future NavigateAndFinsh ({context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);
Color getColor(Set<MaterialState> states ,) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return defultColor;
  }
  return defultColor;
}

var myNewFont = TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w400);
var myFontStyle = TextStyle(color: Colors.white, letterSpacing: 3);



int num(){
  int i ;
 for(i=0 ; i<5;i++){
   if(i==4 ){
     i=0;
   }
 }
 return i;
}

Color getColorFrom(String colorStr) {

  String valueString = colorStr.split('(0x')[1].split(')')[0];
  int value = int.parse(valueString, radix: 16);
  return Color(value);
}

int generte(){
  Random random = new Random();
  int randomNumber = random.nextInt(4);
  return randomNumber;
}