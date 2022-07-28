import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/createTaskScreen/presention/createTaskWidget/createTaskWidget.dart';
import '../../../../core/util/constant/constant.dart';
import '../../../../core/util/widgets/customIconButton.dart';

class CreateTaskScreen extends StatelessWidget {
  var ScaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(
          title:Text('Add task'),


        leading: CustomIconButton(onTap: (){ NavigatePop(context: context);},Widgeticon: Icon(Icons.arrow_back_ios),color: Colors.black,)
      ),
      body: CreateTaskWidget(),
    );
  }
}
