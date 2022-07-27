import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/scheduleScreen/presention/widgets/scheduleWidget.dart';
import 'package:todo_algoriza/util/widgets/customIconButton.dart';

import '../../../../util/constant/constant.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:Text('Schedule'),
        leading:CustomIconButton(onTap: (){ NavigatePop(context: context);},Widgeticon: Icon(Icons.arrow_back_ios),color: Colors.black,)
      ),
      body: ScheduleWidget(),
    );
  }
}
