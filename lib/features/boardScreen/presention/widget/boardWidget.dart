import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/createTaskScreen/presention/createTaskScreen/createTaskScreen.dart';
import 'package:todo_algoriza/features/boardScreen/presention/widget/favoriteWidget.dart';
import 'package:todo_algoriza/core/util/style/colors.dart';
import 'package:todo_algoriza/core/util/widgets/customButton.dart';

import '../../../../core/util/constant/constant.dart';
import 'allScreen.dart';
import 'completedScreen.dart';
import 'UnCompletedScreen.dart';

class BoarderWidget extends StatelessWidget {
  const BoarderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Tab Title
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))
          ),
          child: const TabBar(

             tabs: [
              Tab(text:'All',),
               Tab(text:'Completed',),
               Tab(text:'UnCompleted',),
               Tab(text:'Favorite',),

            ],
          ),
        ),
        //Screens
         Expanded(
          child: TabBarView(
            children: [
              const AllScreen(),
              const CompletedScreen(),
             UnCompletedScreen(),
              const FavoriteScreen(),

            ],
          ),
        ),
        //Creat Task Button
        Padding(
           padding: const EdgeInsets.only(top: 15,right: 25,left: 25),
          child: CustomButton(text: 'Create Task', onTap: (){
            NavigateTo(context: context,router:  CreateTaskScreen());
          }),
        ),


      ],
    );
  }
}
