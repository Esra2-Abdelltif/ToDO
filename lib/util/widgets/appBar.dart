import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/createTaskScreen/presention/createTaskScreen/createTaskScreen.dart';

import '../constant/constant.dart';

class CustomAppBar extends StatelessWidget {
  final  Title;
  final bool isFrist;
  const CustomAppBar({Key? key, required this.Title, this.isFrist=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new  AppBar(
      title:new Text("${Title}") ,
     leading: isFrist ? null : IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
       NavigatePop(context: context);
     }),
      actions: [
        isFrist ?IconButton(onPressed: (){

        }, icon: IconButton(icon: Icon(Icons.menu),onPressed: (){
         NavigateTo(context: context,router: CreateTaskScreen());
        })) : SizedBox.shrink() ,
      ],

    );
  }
}
