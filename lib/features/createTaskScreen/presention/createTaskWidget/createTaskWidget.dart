// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/util/Bloc/cubit.dart';
import 'package:todo_algoriza/core/util/Bloc/states.dart';
import 'package:todo_algoriza/core/util/services/notfication_services.dart';
import 'package:todo_algoriza/core/util/widgets/customTextField.dart';

import '../../../../core/util/widgets/customButton.dart';


class CreateTaskWidget extends StatelessWidget {


  var FormKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String StartTime=DateFormat('hh:mm a').format(DateTime.now()).toString();
  String EndTime=DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))).toString();
  String selectRemind = '10 min before';
  List<dynamic> RemindList =['1 day before','1 hour before','30 min before','10 min before'];
  String selectRepeat ='Weekly';
  List<dynamic> RepeatList =['None','Daily','Weekly','Monthly'];


  @override
  Widget build(BuildContext context) {
     return BlocConsumer<AppBloc, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        AppBloc cubit = AppBloc.get(context);
        return Form(
          key: FormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15,right: 25,left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller:cubit.TitleController,
                    hintText: 'Design team meeting',
                    FieldName: 'Title',
                    textInputType: TextInputType.text,


                  ),
                  CustomTextField(
                    controller:cubit.DatelineController,
                    hintText: DateFormat.yMMMd().format(cubit.selectedDateNow),
                    FieldName: 'DeadLine',
                    textInputType: TextInputType.datetime,
                    suffixwidget: IconButton(onPressed: (){

                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('3000-04-04'),

                      )
                          .then((dynamic value) {
                        cubit.DatelineController.text = DateFormat.yMMMd().format(value);

                      });
                    },
                        icon: const Icon(Icons.keyboard_arrow_down_sharp)),
                  ),
                  Row(
                    children: [
                    Expanded(
                      child: CustomTextField(
                        controller:cubit.StartTimeController,
                        hintText:  StartTime,
                        FieldName: 'Start Time',
                        textInputType: TextInputType.datetime,
                        suffixwidget: IconButton(onPressed: (){

                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((dynamic value) {

                            cubit.StartTimeController.text = value.format(context).toString();

                          });
                        },
                            icon: const Icon(Icons.access_time_outlined)),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        controller: cubit.EndTimeController,
                        hintText:EndTime,
                        FieldName: 'End Time',
                        textInputType: TextInputType.datetime,
                        suffixwidget: IconButton(onPressed: (){
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((dynamic value) {

                            cubit.EndTimeController.text = value.format(context).toString();

                          });
                        },
                            icon: const Icon(Icons.access_time_outlined)),
                      ),
                    ),
                  ],),
                  CustomTextField(
                    controller: cubit.RemindController ,
                    hintText: selectRemind,
                    FieldName: ' Remind',
                    textInputType: TextInputType.text,
                    suffixwidget: DropdownButton(
                      items: RemindList.map((value) => DropdownMenuItem(
                          value: value,
                          child:Text(value))).toList(),
                      onChanged: (value) {
                        cubit.RemindController.text =value.toString();
                      },
                      icon:const Icon(Icons.keyboard_arrow_down_sharp) ,
                    ),
                  ),
                  CustomTextField(
                    controller: cubit.RepeatController,
                    hintText: selectRepeat,
                    FieldName: 'Repeat',
                    textInputType: TextInputType.text,
                    suffixwidget: DropdownButton(
                      items: RepeatList.map((value) => DropdownMenuItem(
                          value: value,
                          child:Text(value))).toList(),
                      onChanged: (value) {
                        cubit.RepeatController.text =value.toString();
                      },
                      icon:const Icon(Icons.keyboard_arrow_down_sharp) ,
                    ),
                  ),
                  const SizedBox(height: 60,),
                  CustomButton(text: 'Create a Task', onTap: (){
                    if(FormKey.currentState!.validate()) {
                    cubit.InsertDataBase();
                    debugPrint('Data inserted');
                   cubit.notifyHelper.displayNotification(Title: '${cubit.TitleController.text}' , body: 'Created ');
                    //NotifyHelper().scheduledNotification(Title: 'Create Task', body: 'Done');

                      }
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
