import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/boardScreen/presention/widget/allScreen.dart';
import 'package:todo_algoriza/features/boardScreen/presention/widget/boardWidget.dart';
import 'package:todo_algoriza/features/boardScreen/presention/widget/completedScreen.dart';
import 'package:todo_algoriza/features/notifiacationScreen/presention/notifiacationScreen/notification.dart';
import 'package:todo_algoriza/features/scheduleScreen/presention/pages/scheduleScreen.dart';
import 'package:todo_algoriza/features/boardScreen/presention/widget/UnCompletedScreen.dart';
import 'package:todo_algoriza/core/util/Bloc/cubit.dart';
import 'package:todo_algoriza/core/util/Bloc/states.dart';
import 'package:todo_algoriza/core/util/style/colors.dart';
import 'package:todo_algoriza/core/util/widgets/appBar.dart';
import '../../../../core/util/widgets/customIconButton.dart';

import '../../../../core/util/constant/constant.dart';

class Boardscreen extends StatelessWidget {
  var ScaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppBloc,AppStates>(
      listener:(BuildContext context,AppStates state){} ,
      builder: (BuildContext context,AppStates state){
        AppBloc cubit = AppBloc.get(context);


        return  DefaultTabController(
            length: 4,
            child: Scaffold(
              key: ScaffoldKey,
              appBar:AppBar(
                title:new Text('Board',style: TextStyle(fontSize: 25)) ,

                actions: [
                  CustomIconButton(onTap: (){ NavigateTo(context: context,router: ScheduleScreen());},
                      Widgeticon: Icon(Icons.date_range,color: defultColor)),
                  CustomIconButton( onTap: ()=>
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete All Items',style: TextStyle(color: Colors.white, fontSize: 18)),
                          content: const Text('Do You sure ?',  style: TextStyle(color: Colors.white, fontSize: 18)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel',  style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                            TextButton(
                              onPressed: () {
                                AppBloc.get(context).deleteAll(Database: cubit.db);
                                Navigator.pop(context);
                              },
                              child: const Text('OK',  style: TextStyle(color:Colors.white, fontSize: 18)),
                            ),
                          ],
                          elevation: 24,
                          backgroundColor: defultColor,
                          // shape: CircleBorder(),
                        ),
                      ),
                      Widgeticon: Icon(Icons.cleaning_services,color: defultColor)),



                ],

              ),
              body: BoarderWidget()
            )

        );

      },
    );
  }
}
