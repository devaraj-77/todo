import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/Todoservice.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController todocontroller = TextEditingController();
  void showeditdailog(BuildContext context, String id, String currentText){
   TextEditingController editingController = TextEditingController(text: currentText);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: TextField(
            controller: editingController,
            decoration: InputDecoration(
              hintText: 'Enter new task',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                updateTodo(id, editingController.text);Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 238),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(width: 400,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 236, 233, 233),
                      const Color.fromARGB(255, 241, 136, 55),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'TODO LIST',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: TextField(
                              controller: todocontroller,
                              decoration: InputDecoration(
                                hintText: 'Enter task',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (todocontroller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Please enter a task")),
                                );
                                return;
                              }
                              addTodo(context, todocontroller.text);
                              todocontroller.clear();
                            },
                            child: Text('Add'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 7, 7, 7),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ]
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                       child: StreamBuilder<QuerySnapshot>(
                      stream: getTodos(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var todos = snapshot.data!.docs;

                              return Expanded(
                                child: ListView.builder(
                                  itemCount: todos.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(todos[index]['todo']),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 20),
                                          IconButton(
                                            icon: Icon(Icons.delete, color: Colors.red),
                                            onPressed: () {
                                              deleteTodo(todos[index].id);
                                            },
                                          ),
                                          SizedBox(width: 20),
                                         // ...existing code...
                                        IconButton(
                                         icon: Icon(Icons.edit),
                                        onPressed: () {
                                         showeditdailog(context, todos[index].id, todos[index]['todo']);
                                        },
                                        ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
                              ),
                      )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
  }}
                     