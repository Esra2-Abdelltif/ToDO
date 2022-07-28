import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/Bloc/cubit.dart';
import 'package:todo_algoriza/core/util/widgets/BuildTask.dart';
import 'package:todo_algoriza/core/util/widgets/emptyScreen.dart';

import '../../../../core/util/Bloc/states.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppBloc,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state) {
          AppBloc cubit =AppBloc.get(context);
          var Tasks= cubit.allTasks;

          return  AppBloc.get(context).allTasks.isEmpty
              ? Expanded(
            child:EmptyScreen(),
          )
              : Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                AppBloc.get(context).GetDataFromDataBase(cubit.db);
              },
              child: ListView.builder(
                  itemBuilder: (context, index) => BuildTask(
                      item: AppBloc.get(context).allTasks[index],color: cubit.colorslist[index % cubit.colorslist.length],),
                  itemCount: AppBloc.get(context).allTasks.length),
            ),
          );

        });
  }
}
