import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_algoriza/util/style/colors.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text ('You do not have any Tasks Yet ..!',style: TextStyle(color: defultColor,fontSize: 20),),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BounceInDown(duration: Duration(seconds: 3),child: Square() ),
                BounceInUp(duration: Duration(seconds: 3),child: Square() ),
                BounceInLeft(duration: Duration(seconds: 3),child: Square() ),
                BounceInRight(duration: Duration(seconds: 3),child: Square() ),

              ],
            ),


          ],
        ));
  }
}
Widget Square()=>Container(
  width: 50,
  height: 50,
  decoration: BoxDecoration(
    color:defultColor,
  ),
);