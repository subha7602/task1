import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/main.dart';
import 'package:task1/t_key.dart';
import '../localisation_service.dart';
Widget spaceBox() {
  return Expanded(
    flex: 1,
    child: SizedBox(), // Added SizedBox to create space
  );
}
Widget button({String? buttonText, required VoidCallback onPressed}) {
  String text = buttonText ?? 'Button Text'; // Set default text if buttonText is null

  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      primary: Colors.white, // White color for the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Curved border
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.blue, // Text color for the button text
        fontSize: 16, // Adjust the font size as needed
      ),
    ),
  );
}

class CustomImageContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  const CustomImageContainer({Key? key, required this.imagePath, this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.height * 0.04, // Make width the same as height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50), // Make it a circle
          border: Border.all( // Add this
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
    )

    ;
  }
}class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late String selectedLanguage = Tkeys.English.translate(context); // Initially set to English
  late bool isEnglish = true; // Initially set to true for English
  late String currentLanguage = Tkeys.English.translate(context); // Initially set to English
  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.blue,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              _showLanguageDialog(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text('Language'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AutoSizeText(Tkeys.ChooseLanguage.translate(context), maxLines: 1,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption(Tkeys.Tamil.translate(context), () {
                _handleLanguageSelection(Tkeys.Tamil.translate(context), false);
              }),
              _buildLanguageOption(Tkeys.English.translate(context), () {
                _handleLanguageSelection(Tkeys.English.translate(context), true);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(language),
      ),
    );
  }

  void _handleLanguageSelection(String language, bool isEng) {
    if ((currentLanguage == Tkeys.Tamil.translate(context) && language == Tkeys.Tamil.translate(context)) ||
        (currentLanguage == Tkeys.English.translate(context) && language == Tkeys.English.translate(context))) {
      Navigator.pop(context); // If the selected language matches the current language, close the dialog without changing anything
      return;
    }

    setState(() {
      selectedLanguage = language;
      isEnglish = isEng;
      localizationController.toggleLanguage(context);
      currentLanguage = selectedLanguage;
    });

    Navigator.pop(context); // Close the dialog after changing the language
  }
}






