import 'package:isar/isar.dart';

part 'habit.g.dart';

@Collection()
class Habit {
  Id id = Isar.autoIncrement;
  late String name;
  // datetime format will be: DateTime(year, month, day)
  List<DateTime> completedDays = [];
}
