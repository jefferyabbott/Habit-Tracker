import 'package:flutter/material.dart';
import 'package:habit_tracker/components/side_drawer.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void createNewHabit() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Create a new habit",
            ),
          ),
          actions: [
            // cancel button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                textController.clear();
              },
              child: const Text('cancel'),
            ),
            // save button
            MaterialButton(
              onPressed: () {
                String newHabitName = textController.text;
                context.read<HabitDatabase>().addHabit(newHabitName);
                Navigator.pop(context);
                textController.clear();
              },
              child: const Text('save'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: SideDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
