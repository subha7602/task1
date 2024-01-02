import 'package:task1/utils/imports.dart';
Widget spaceBox() {
  return Expanded(
    flex: 1,
    child: SizedBox(), // Added SizedBox to create space
  );
}

Widget button({
  String? buttonText,
  required Function onPressed, // Change the type to Function
  Color buttonColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  String text = buttonText ?? 'Button Text';

  return ElevatedButton(
    onPressed: () {
      if (onPressed is VoidCallback) {
        onPressed(); // Call the onPressed callback if it's a VoidCallback
      } else if (onPressed is Function) {
        // Call the callback with the BuildContext argument
        onPressed();
      }
    },
    style: ElevatedButton.styleFrom(
      primary: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
      ),
    ),
  );
}

class CustomImageContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  const CustomImageContainer({
    Key? key,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.height *
            0.04, // Make width the same as height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50), // Make it a circle
          border: Border.all(
            // Add this
            color: Colors.black, // Set the color
            width: 1.0, // Set the width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50), // Make it a circle
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLanguageButton extends StatefulWidget {
  final Color buttonColor;
  final Color textColor;

  CustomLanguageButton({required this.buttonColor, required this.textColor});

  @override
  _CustomLanguageButtonState createState() => _CustomLanguageButtonState();
}

class _CustomLanguageButtonState extends State<CustomLanguageButton> {
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return
      Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(10.0),
          child:
          Container(
            height: MediaQuery.of(context).size.height *
                (kIsWeb ? 0.05 : 0.05 ), // Adjust the height based on platform
            width: MediaQuery.of(context).size.width *
                (kIsWeb ? 0.05 : 0.2), // Adjust the width based on platform
            decoration: BoxDecoration(
              color: widget.buttonColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            GestureDetector(
                              child: Center(child: AutoSizeText("English")),
                              onTap: () {
                                Get.find<LocalizationController>()
                                    .changeLanguage('en');
                                setState(() {
                                  _language = 'English';
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            GestureDetector(
                              child: Center(child: Text('தமிழ்')),
                              onTap: () {
                                Get.find<LocalizationController>()
                                    .changeLanguage('ta');
                                setState(() {
                                  _language = 'தமிழ்';
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: AutoSizeText(
                _language,
                style: TextStyle(color: widget.textColor, fontSize: kIsWeb ? 12 : 14), // Adjust the font size based on platform
              ),
            ),
          )

        ),
      ),
    )
    ;
  }
}
