import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_login/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/screens/home_screen.dart';

class NewUserController extends GetxController {
  TextEditingController contEmail = TextEditingController();
  TextEditingController contPass = TextEditingController();
  TextEditingController contName = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (formKey2.currentState!.validate()) {
      Get.snackbar('Success', 'User Logged in successfully.');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      User user = User('Ali', contEmail.text, contPass.text);
      await prefs.setString('user', user.toJson());
      Get.to(
          transition: Transition.cupertino,
          duration: Duration(seconds: 1),
          () => HomeScreen());
    } else {
      Get.snackbar('Failed', 'Something Went Wrong.',
          backgroundColor: Colors.red);
    }
  }
// }

// class NewUserController2 extends GetxController {
//   TextEditingController contEmail = TextEditingController();
//   TextEditingController contPass = TextEditingController();
//   TextEditingController contName = TextEditingController();

//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   void signIn() {
//     if (formKey.currentState!.validate()) {
//       Get.snackbar('Success', 'User Logged in successfully.');
//       Get.to(
//           transition: Transition.cupertino,
//           duration: Duration(seconds: 1),
//           () => HomeScreen());
//     } else {
//       Get.snackbar('Failed', 'Something Went Wrong.',
//           backgroundColor: Colors.red);
//     }
//   }
// }
}
