import 'package:flutter/material.dart';

class  CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String FieldName;
  final Widget? suffixwidget;
  final TextInputType textInputType;
  bool IsSuffixWidget =false;
  CustomTextField({
    Key? key,
    required this.FieldName,
    required this.controller,
    required this.hintText,
    this.suffixwidget=null,

    required this.textInputType,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(FieldName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
            Padding(
              padding: const EdgeInsets.only(top:  15,bottom: 15),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color:Colors.grey.shade100)

                ),
                child: Expanded(
                  child: TextFormField(


                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText:hintText,
                      contentPadding: EdgeInsets.all(20.0),
                      hintStyle:TextStyle(fontSize: 15,color: Colors.grey.shade500,fontStyle: FontStyle.italic ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIcon:suffixwidget,

                    ),
                    autofocus: false,
                    readOnly: suffixwidget !=null? true:false,
                    controller: controller,
                    keyboardType:textInputType,

                  ),
                ),
              ),
            ),
          ],

      ),
    );
  }
}


