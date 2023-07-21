import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/models/task.dart';
import 'package:to_do_list_app/models/task_data.dart';

class BottomSheetModal extends StatefulWidget {
  const BottomSheetModal({
    super.key,
  });

  @override
  State<BottomSheetModal> createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> {
  String? title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(
                  color: kBackgroundColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (newValue) {
                  title = newValue;
                },
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Enter task Title",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kBackgroundColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(Task(title: title!));
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
