import 'package:flutter/material.dart';

class SimpleTextField extends StatefulWidget {
  const SimpleTextField({
    this.textInputType,
    this.controller,
    this.hintText,
    this.textColor = Colors.black,
    this.validator,
    this.errorText,
    this.obscureText = false,
    this.prefixIconData,
    this.suffixIcon,
    this.fillColor,
    this.labelText,
    Key? key,
  }) : super(key: key);

  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? hintText;
  final Color textColor;
  final bool Function(String)? validator;
  final String? errorText;
  final String? labelText;
  final bool obscureText;
  final IconData? prefixIconData;
  final Widget? suffixIcon;
  final Color? fillColor;

  @override
  SimpleTextFieldState createState() => SimpleTextFieldState();
}

class SimpleTextFieldState extends State<SimpleTextField> {
  late TextEditingController textEditingController;
  late bool _isValid;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _isValid = true;
    _obscureText = widget.obscureText;
    textEditingController = widget.controller ?? TextEditingController();
  }
// Email Validator

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: textEditingController,
            keyboardType: widget.textInputType,
            onChanged: (value) {
              setState(() {
                _isValid =
                    widget.validator != null ? widget.validator!(value) : true;
              });
            },
            maxLines: 1,
            style: TextStyle(color: widget.textColor),
            cursorColor: widget.textColor,
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: widget.hintText, // Changed hintText to labelText
                labelStyle: TextStyle(color: widget.textColor.withOpacity(.45)), // Added this
              hintText: widget.hintText,
              hintStyle: TextStyle(color: widget.textColor.withOpacity(.45)),
              errorText: !_isValid ? widget.errorText : null,
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              prefixIcon: widget.prefixIconData != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: Icon(
                        widget.prefixIconData,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.all(15), // Added this
              border: OutlineInputBorder( // Added this
                borderRadius: BorderRadius.circular(30),)
            ),
          ),
        ],
      ),
    );
  }
}
