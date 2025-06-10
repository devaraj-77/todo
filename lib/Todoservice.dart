import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> addTodo(BuildContext context, String todo) async { 
  try {
    await FirebaseFirestore.instance.collection('todos').add({
      "todo": todo,
      "time": Timestamp.now(),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Todo Added Successfully")),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to add Todo")),
    );
  }
}

Stream<QuerySnapshot> getTodos() {
  return FirebaseFirestore.instance.collection('todos')
      .orderBy('time', descending: true)
      .snapshots();
}
Future<void> deleteTodo(String id) async {
    await FirebaseFirestore.instance.collection('todos').doc(id).delete();
  } 
Future<void> updateTodo(String id, String Text) async {
  await FirebaseFirestore.instance.collection('todos').doc(id).update({
      "todo": Text, });
  } 