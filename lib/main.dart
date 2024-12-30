import 'package:flutter/material.dart';
import 'package:expense_app/view/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge : const  TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              labelLarge: const TextStyle(
                color: Colors.purpleAccent,
              ),
            ),
        appBarTheme: AppBarTheme(
          toolbarTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                headlineSmall: const TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 22,
                  fontWeight: FontWeight.w100,
                ),
              ).bodyMedium,
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                headlineSmall: const TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 22,
                  fontWeight: FontWeight.w100,
                ),
              )
              .headlineSmall,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.deepPurpleAccent),
      ),
      home: MyApp(),
    );
  }
}