import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:habit_tracker/pages/home_page.dart';
import 'package:habit_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init database
  await HabitDatabase.initialize();
  await HabitDatabase.saveFirstLaunchDate();
  runApp(
    MultiProvider(
      providers: [
        // habit database
        ChangeNotifierProvider(create: (context) => HabitDatabase()),
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const HabitTracker(),
    ),
  );
}

class HabitTracker extends StatelessWidget {
  const HabitTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
