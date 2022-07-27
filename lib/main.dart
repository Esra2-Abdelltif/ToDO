import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/boardScreen/presention/pages/boardscreen.dart';
import 'package:todo_algoriza/util/Bloc/cubit.dart';
import 'package:todo_algoriza/util/Bloc/observer_bloc.dart';
import 'package:todo_algoriza/util/services/notfication_services.dart';
import 'package:todo_algoriza/util/style/theme.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  NotifyHelper().initializeNotification();
  NotifyHelper().requestIOSPermissions();

  BlocOverrides.runZoned( () {
    runApp(const MyApp());


  },
    blocObserver: MyBlocObserver(),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

       BlocProvider(create:(BuildContext context )=> AppBloc()..Notification()..CreatDataBase())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:lightthemes,
        home: Boardscreen(),
      ),
    );
  }
}

