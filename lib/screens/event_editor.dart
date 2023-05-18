import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/style/app_style.dart';
import 'package:flutter/material.dart';

class EventEditorScreen extends StatefulWidget {
  const EventEditorScreen({Key? key}) : super(key: key);

  @override
  State<EventEditorScreen> createState() => _EventEditorScreenState();
}

class _EventEditorScreenState extends State<EventEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);

  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.cardsColor[color_id],
        appBar: AppBar(
          backgroundColor: AppStyle.cardsColor[color_id],
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Add an event",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'event name',
                ),
                style: AppStyle.mainTitle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                date,
                style: AppStyle.dateTitle,
              ),
              const SizedBox(
                height: 28,
              ),
              TextField(
                controller: _mainController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'event description',
                ),
                style: AppStyle.mainContent,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
            FirebaseFirestore.instance.collection("events").add({
              "event_title": _titleController.text,
              "date": date,
              "event_content": _mainController.text,
              "color_id": color_id
            }).then((value) {
              print(value.id);
              Navigator.pop(context);
            }).catchError((error) =>
                print("Failed to add the event due to $error"));
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
