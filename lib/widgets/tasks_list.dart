import 'package:flutter/material.dart';
import 'package:study_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:study_list/models/tasks_data.dart';


class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.task[index];
          return TaskTile (
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: (){
                taskData.deleteTask(task);
          },
          );
        },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}