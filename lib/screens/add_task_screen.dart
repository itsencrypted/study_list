import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_list/models/task.dart';
import 'package:provider/provider.dart';
import 'package:study_list/models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  final kLightBlueish = Color(0xFF33BBB5);
  final kLightGreen = Color(0xFF95E08E);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient (
                colors: [kLightBlueish, kLightGreen],
                begin: const FractionalOffset(1.0, 1.0),
                end: const FractionalOffset(0.2, 0.2),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text('Things to Study',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          FlatButton(
            child: Text('Add', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
            color: kLightBlueish,
            onPressed: (){
              final task = Task(name: newTaskTitle);
              Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
              Navigator.pop(context);
            },
          ),
        ],
        ),
      ),
    );
  }
}
