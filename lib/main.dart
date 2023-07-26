import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_login/models/user.dart';
import 'package:new_login/views/screens/Signin_screen.dart';
import 'package:new_login/views/screens/home_screen.dart';
import 'package:new_login/views/screens/new_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_login/views/screens/description.dart';

void main() {
  runApp(const MyApp());
}

User? user;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade500),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue.shade500,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: Size(MediaQuery.of(context).size.width / 2, 50),
          ),
        ),
      ),
      home:SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    myInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('asadadad'),
      ),
    );
  }

  myInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      String userJson = prefs.getString('user')!;
      print('user -> $userJson');
      user = User.fromJson(userJson);
      Get.to(() => HomeScreen());
    } else {
      print('else');
      Get.to(
        () => SignInScreen(),
      );
    }
  }
}
