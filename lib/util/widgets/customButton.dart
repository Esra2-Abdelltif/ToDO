import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/util/style/colors.dart';

class CustomButton extends StatelessWidget {
  final double width ;
  final double height ;
  final double borderRadius;
  final Color color;
  final  double fontsize;
  final String text;
  final VoidCallback onTap;
  final Color Fontcolor;
  final Color borderColor;
  final double borderWidth;


  const CustomButton({Key? key,this.borderWidth =1,this.borderColor=defultColor,
    this.width=double.infinity ,this.height=55,this.borderRadius =15 ,this.Fontcolor = Colors.white ,required this.text,this.fontsize=16,this.color=defultColor,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 25,),
      child: Container(
        width: width ,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            width: borderWidth,
            color: borderColor,
          ),
        ),

        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          //color: color,
          hoverColor:  Color(0xFF8D8E98),
          onPressed: onTap,
          child: Text(text,
            style: TextStyle(
              fontSize:fontsize,
              color: Fontcolor,
            ),
          ),
        ),
      ),
    );
  }
}

