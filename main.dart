import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';
import 'book_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Manager',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueAccent,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            elevation: 4,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          cardTheme: CardTheme(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        home: BookScreen(),
      ),
    );
  }
}
