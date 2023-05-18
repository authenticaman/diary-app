import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/style/app_style.dart';
import 'package:flutter/material.dart';

class EventReaderScreen extends StatefulWidget {
  EventReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<EventReaderScreen> createState() => _EventReaderScreenState();
}

class _EventReaderScreenState extends State<EventReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppStyle.cardsColor[color_id],
          appBar: AppBar(
            backgroundColor: AppStyle.cardsColor[color_id],
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doc["event_title"],
                  style: AppStyle.mainTitle,
                ),
                const SizedBox(height: 4,),
                Text(
                  widget.doc["date"],
                  style: AppStyle.dateTitle,
                ),
                const SizedBox(height: 30,),
                Text(
                  widget.doc["event_content"],
                  style: AppStyle.dateTitle,
                ),
              ],
            ),
          ),
      ),
    );
  }
}
