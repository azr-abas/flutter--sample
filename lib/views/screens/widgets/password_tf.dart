import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    super.key,
    required this.contPass,
  });
  final TextEditingController contPass;
  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: TextFormField(
          controller: widget.contPass,
          keyboardType: TextInputType.visiblePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) return 'This field is required';
            if (!(value.length > 8)) {
              return 'Password length should be greater than 8';
            }
            return null;
          },
          obscureText: obscure,
          decoration: InputDecoration(
              labelText: 'Password',
              isDense: true,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: InkWell(
                child: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ));
  }
}
