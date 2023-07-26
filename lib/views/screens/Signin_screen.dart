import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:new_login/controller/user_controller.dart';
import 'package:new_login/views/screens/home_screen.dart';
import 'package:new_login/views/screens/signup_screen.dart';
import 'package:new_login/views/screens/widgets/all.dart';
import 'package:new_login/views/screens/widgets/password_tf.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final c = Get.put(NewUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: c.formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.blue,
                      size: 90,
                    ),
                    TextFieldWidget(
                      h: c.contEmail,
                      label: 'Email address',
                      iconData: Icons.email,
                      validator: (p0) {
                        if (!(p0!.isEmail)) {
                          return 'Please provide correct Email';
                        }
                      },
                    ),
                    PasswordWidget(
                      contPass: c.contPass,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () => c.signIn(),
                        child: const Text('Sign In')),
                    const SizedBox(
                      height: 50,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: const TextStyle(color: Colors.black),
                            children: [
                          WidgetSpan(
                              child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('Signup'),
                            ),
                            onTap: () => Get.to(() => RegisterPage()),
                          ))
                        ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
