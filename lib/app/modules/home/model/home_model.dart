
import 'package:flutter/material.dart';

class HomeModel{
  IconData icon;
  String title;
  String description;
  DateTime dateTime;
  String price;
  bool isCredited;
  HomeModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.price,
    required this.isCredited
  });
}