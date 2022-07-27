import 'package:flutter/material.dart';
import 'package:todo_algoriza/util/style/colors.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget Widgeticon;
  final Color color ;
  final double iconSize;

  const CustomIconButton({Key? key,required this.onTap,required this.Widgeticon , this.color=defultColor,this.iconSize=25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
        iconSize: iconSize,
        onPressed: onTap, icon: Widgeticon);
  }
}
