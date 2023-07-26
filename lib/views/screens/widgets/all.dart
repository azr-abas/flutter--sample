import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.h,
    required this.label,
    required this.iconData,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController h;
  final String label;
  final IconData iconData;
  final TextInputType? keyboardType;
  final Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        controller: h,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // validator: (value) {
        //   if (value!.isEmpty) return "This Field is required";
        //   if (!(value.isEmail)) return "Please provide correct email address";
        //   return null;
        // },

        validator: (String? value) {
          if (value!.isEmpty) {
            return 'This Field is Required';
          }

          if (validator != null) return validator!(value);
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}




















































// class EmailWidget extends StatelessWidget {
//   const EmailWidget({
//     super.key,
//     required this.contEmail,
//     required this.label,
//     required this.iconData,
//     this.keyboardType,
//     this.validator,
//   });

//   final TextEditingController contEmail;
//   final String label;
//   final IconData iconData;
//   final TextInputType? keyboardType;
//   final Function(String)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.only(top: 15),
//         child: TextFormField(
//           controller: contEmail,
//           keyboardType: keyboardType,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           // validator: (value) {
//           //   if (value!.isEmpty) return 'This field is required';
//           //   if (!(value.isEmail)) {
//           //     return 'Please provide correct Email address';
//           //   }
//           //   return null;
//           // },
//           validator: (String? value) {
            
//           },



//           decoration: InputDecoration(
//               isDense: true,
//               labelText: label,
//               prefixIcon: Icon(Icons.email),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               )),
//         ));
//   }
// }
