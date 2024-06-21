import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego/pages/_landing.dart';
import 'package:zego/pages/_second.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? result = prefs.getBool("isFirstTime");
  runApp(MyApp(
    isFirstTime: result ?? true, // Set default to true to show the landing page for the first time
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF52b69a),
          secondary: Color(0xFFcad2c5),
          background: Color(0xff181a18),
        ),
      ),
      home: isFirstTime ? LandingPage() : SecondPage(), // Correct the usage of isFirstTime
    );
  }
}