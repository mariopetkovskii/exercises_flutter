import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Exam{
  String id;
   String subject;
   DateTime datetime;
   TimeOfDay time;
   int duration;
   LatLng latLng;
   Exam({required this.id, required this.subject, required this.datetime, required this.time, required this.duration, required this.latLng});
}