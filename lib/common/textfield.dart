import 'package:task1/utils/imports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
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
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity, // Adjust the width of the container as needed

        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double dynamicFontSize = MediaQuery.of(context).size.width *
              0.01; // Adjust this multiplier as needed
          if (constraints.maxWidth < 400) {
            dynamicFontSize = MediaQuery.of(context).size.width *
                0.04; // Change font size for smaller screens
          }
          return TextField(
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
              labelText: widget.labelText,
              // Changed to labelText
              labelStyle: TextStyle(color: widget.textColor.withOpacity(.45)),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: widget.textColor.withOpacity(.45),
                  fontSize: dynamicFontSize),
              errorText: !_isValid ? widget.errorText : null,
              errorStyle: TextStyle(color: Colors.white),
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
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              // Changed to auto
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ),
    );
  }
}
