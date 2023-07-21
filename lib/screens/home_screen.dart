import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/models/task_data.dart';
import 'package:to_do_list_app/widgets/bottom_sheet_modal.dart';
import 'package:to_do_list_app/widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'To Do List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
                right: 8.0,
              ),
              child: Consumer<TaskData>(
                builder: (context, value, child) => Text(
                  "${value.tasks.length} Tasks",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 40.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const TasksList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const BottomSheetModal(),
            isDismissible: true,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
