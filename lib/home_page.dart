

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage{
  static CustomTextField(
            TextEditingController controller, String text,IconData iconData,bool tohide){
      return Padding(
        padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
        child: TextField(
          controller: controller,
          obscureText: tohide,
          decoration: InputDecoration(
            hintText: text,
            prefixIcon: Icon(iconData),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
          ),
        ),
      );


  }
  static CustomButton(VoidCallback voidCallback,String text){
    return SizedBox(height: 50, width: 200,
      child: ElevatedButton(
      onPressed: () {
        voidCallback();
      },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      )),child: Text(text,style: TextStyle(fontSize: 20, color: Colors.red),),
    ),
    );
  }
  static CustomAlertBox(BuildContext context, String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('OK')
          )
        ],
      );
    }
    );
  }
}
