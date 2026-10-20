import 'package:ahad_provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var task;

    return Scaffold(
      appBar: AppBar(title: Text("Adding Items in List")),
      body: Container(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        color: Colors.amber[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 3,
                controller: descriptionController,
                decoration: InputDecoration(
                  label: Text("Description"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var title = titleController.text;
                  var description = descriptionController.text;
                  if (title.isNotEmpty && description.isNotEmpty) {
                    task = context.read<TaskProvider>().addTask({
                      "title": title,
                      "description": description,
                    });
                  }
                  if (task.isNotEmpty) {
                    Navigator.pop(context);
                  }
                },
                child: Text("Add Task"),
              ), //task will be added on tap and return to page 1
            ],
          ),
        ),
      ),
    );
  }
}
