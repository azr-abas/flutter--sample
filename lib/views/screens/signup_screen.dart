import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_login/controller/user_controller.dart';
import 'package:new_login/views/screens/Signin_screen.dart';
import 'package:new_login/views/screens/widgets/all.dart';
import 'package:new_login/views/screens/widgets/password_tf.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final b = Get.put(NewUserController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: b.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.app_registration_rounded,
                      color: Colors.blue,
                      size: 90,
                    ),
                    TextFieldWidget(
                        h: b.contName,
                        label: 'Name',
                        iconData: Icons.person_3_sharp),
                    TextFieldWidget(
                      h: b.contEmail,
                      label: 'Email address',
                      iconData: Icons.email,
                      validator: (p0) {
                        if (!(p0!.isEmail)) {
                          return 'Please provide correct Email';
                        }
                      },
                    ),
                    PasswordWidget(
                      contPass: b.contPass,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            iconColor: MaterialStatePropertyAll(
                                Colors.purple.shade400)),
                        onPressed: () => b.signIn(),
                        child: const Text('Register')),
                    const SizedBox(
                      height: 50,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(color: Colors.black),
                            children: [
                          WidgetSpan(
                              child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('Sign in'),
                            ),
                            onTap: () => Get.back(),
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
