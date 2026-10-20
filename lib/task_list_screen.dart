import 'package:ahad_provider/add_task_page.dart';
import 'package:ahad_provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("My Tasks")),
      body: Container(
        height: mediaQuery.size.height * 1,
        width: mediaQuery.size.width * 1,

        child: Consumer<TaskProvider>(
          builder: (ctx, provider, child) {
            var taskdata = provider.getData();
            return ListView.builder(
              itemCount: taskdata.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(taskdata[index]['title']),
                  subtitle: Text(taskdata[index]['description']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      provider.removeTask(taskdata[index]);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
