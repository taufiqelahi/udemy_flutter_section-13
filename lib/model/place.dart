import 'package:uuid/uuid.dart';

class Place{
  final String title;
  final String id;

  Place({required this.title, }):id=Uuid().v4();
}