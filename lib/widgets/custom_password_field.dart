import 'package:flutter/material.dart';

class CustompasswordField extends StatefulWidget {
  CustompasswordField ({
    Key? key,
    this.onchanged,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final Function(String)? onchanged;
  final String? hintText;
  final bool obscureText;

  @override
  State<CustompasswordField > createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustompasswordField > {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      onChanged: widget.onchanged,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Enter ${widget.hintText}';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
