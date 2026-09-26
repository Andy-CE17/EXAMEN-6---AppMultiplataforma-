import 'package:flutter/material.dart';

class CalendarEvent {
  const CalendarEvent({
    required this.day,
    required this.month,
    required this.time,
    required this.title,
    required this.location,
    required this.color,
    required this.icon,
  });

  final String day;
  final String month;
  final String time;
  final String title;
  final String location;
  final Color color;
  final IconData icon;
}
