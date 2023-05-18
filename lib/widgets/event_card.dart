import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/style/app_style.dart';
import 'package:flutter/material.dart';

Widget eventCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["event_title"],
            style: AppStyle.mainTitle,
          ),
          const SizedBox(height: 4,),
          Text(
            doc["date"],
            style: AppStyle.dateTitle,
          ),
          const SizedBox(height: 8,),
          Text(
            doc["event_content"],
            style: AppStyle.dateTitle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}