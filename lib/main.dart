import 'package:flutter/material.dart';
import 'package:habittracker/config/theme/theme_provider.dart';
import 'package:habittracker/database/habit_database.dart';
import 'package:habittracker/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HabitDatabase.init();

  await HabitDatabase().saveFirstLaunchDate();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      
      ),
      ChangeNotifierProvider(
      create: (context) => HabitDatabase(),
      
      )
    ],
    child: const MyApp(),
    )
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
} 