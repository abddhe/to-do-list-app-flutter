import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) => ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) => GestureDetector(
              onDoubleTap: () => taskData.removeTask(taskData.tasks[index]),
              child: ListTile(
                title: Text(
                  taskData.tasks[index].title,
                  style: TextStyle(
                    fontSize: 18.0,
                    decoration: taskData.tasks[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Checkbox(
                  onChanged: (value) {
                    taskData.changeDone(taskData.tasks[index], value!);
                  },
                  value: taskData.tasks[index].isDone,
                ),
              ),
            ),
          )),
    );
  }
}
