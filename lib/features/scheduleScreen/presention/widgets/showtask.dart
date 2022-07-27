import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/features/scheduleScreen/presention/widgets/taskTile.dart';
import 'package:todo_algoriza/util/Bloc/states.dart';
import 'package:todo_algoriza/util/constant/constant.dart';
import 'package:todo_algoriza/util/widgets/BuildTask.dart';
import 'package:todo_algoriza/util/widgets/emptyScreen.dart';

import '../../../../util/Bloc/cubit.dart';

class ShowTask extends StatelessWidget {
  const ShowTask({Key? key,index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppBloc cubit = AppBloc.get(context);
         // var Tasks = cubit.allTasks;

          return AppBloc.get(context).allTasks.isEmpty ? Expanded(
            child:EmptyScreen(),
          ) : Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                AppBloc.get(context).GetDataFromDataBase();

              },
              child: ListView.builder(

              itemBuilder: (context, index) {
                var Tasks = cubit.allTasks;
                if(Tasks[index]['repreat'] == 'Daily'
                // || Tasks[index]['dateline'] == (cubit.scheduleDate != null ?  DateFormat.yMMMd().format(cubit.scheduleDate!) :  DateFormat.yMMMd().format(cubit.selectedDateNow))
                 // || (Tasks[index]['repreat'] == 'Weekly' && cubit.scheduleDate!.difference(DateFormat.yMMM().parse(Tasks[index]['dateline'])).inDays % 7 ==0)
                // || (Tasks[index]['repreat'] == 'Monthly' &&  DateFormat.yMMM().parse(Tasks[index]['dateline']).day == (cubit.scheduleDate != null ? cubit.scheduleDate! : DateTime.now()))



                ){
                   DateTime date =DateFormat.jm().parse(Tasks[index]['starttime'].toString());
                   var myTime =DateFormat('HH:mm').format(date);
                    cubit.notifyHelper.scheduledNotification(
                        int.parse(myTime.toString().split(':')[0]),
                        int.parse(myTime.toString().split(':')[1]),
                        Tasks);


                  return TaskTile( item: AppBloc.get(context).allTasks[index],color: cubit.colorslist[index % cubit.colorslist.length],);
                }
                if (Tasks[index]['dateline'] == (cubit.scheduleDate != null ? DateFormat.yMMMd().format(cubit.scheduleDate!) : DateFormat.yMMMd().format(cubit.selectedDateNow) )){


                  return TaskTile( item: AppBloc.get(context).allTasks[index],color: cubit.colorslist[index % cubit.colorslist.length],);


                }
                else{
                  return Container();
                }

                },
                  itemCount:AppBloc.get(context).allTasks.length),
            ),
          );

        });
  }
}
