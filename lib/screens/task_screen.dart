import 'package:flutter/material.dart';
import 'package:study_list/models/tasks_data.dart';
import 'package:study_list/widgets/tasks_list.dart';
import 'package:study_list/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {

  final kLightBlueish = Color(0xFF33BBB5);
  final kLightGreen = Color(0xFF95E08E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueish,
      floatingActionButton: FloatingActionButton (
          backgroundColor: kLightGreen,
          child: Icon (Icons.add),
          onPressed: () {
            showModalBottomSheet (
              context: context,
              builder: (context) =>
                  AddTaskScreen(),
            );
          }
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 90, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    child: Icon(Icons.list,
                    color: kLightBlueish,
                    size: 35,
                    ),
                backgroundColor: Colors.white,
                radius: 30,),
                SizedBox(height: 10,),
                Text('Study List', style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),),
                Text('${Provider.of<TaskData>(context).taskCount} Topics to Study', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),),
              ],
            ),
          ),
          Expanded (
            child: Container (
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration (gradient: LinearGradient (
                  colors: [kLightBlueish, kLightGreen],
                  begin: const FractionalOffset(1.0, 1.0),
                  end: const FractionalOffset(0.2, 0.2),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
                borderRadius: BorderRadius.only (
                    topLeft: Radius.circular (30),
                    topRight: Radius.circular (30)),
              ),
            child: TasksList(),
          ),),
        ],
      ),

    );
  }
}







