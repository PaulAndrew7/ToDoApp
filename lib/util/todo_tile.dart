// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteTask,
                borderRadius: BorderRadius.circular(12),
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                foregroundColor: Colors.white,
              )
            ]
        ),
        child: Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFCB9DF0),
              borderRadius: BorderRadius.circular(25),
            )
        ),
      ),
    );
  }
}