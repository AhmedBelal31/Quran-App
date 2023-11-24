import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget saveAndResetButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildButton(
              text: 'Reset',
              onPressed: () {
                setState(() {
                  arabicFontSize = 20;
                  mushafFontSize = 40;
                });
                saveSettings();
              }),
          buildButton(
              text: 'Save',
              onPressed: () {
                saveSettings();
                Navigator.pop(context);
              }),
        ],
      );

  Widget buildButton({required String text, required VoidCallback onPressed}) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  changeArabicFontSize(),
                  const SizedBox(height: 80),
                  changeMushafFontSize(),
                  const SizedBox(height: 100),
                  saveAndResetButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget changeArabicFontSize() => Column(
        children: [
          const Text(
            'Arabic Font Size ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'me_quran'),
          ),
          const SizedBox(height: 15),
          Slider(
            min: 20,
            max: 40,
            activeColor: const Color.fromARGB(255, 56, 115, 59),
            value: arabicFontSize,
            onChanged: (value) {
              setState(() {
                arabicFontSize = value;
              });
            },
          ),
          Text(
            "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ",
            style: TextStyle(fontFamily: 'quran', fontSize: arabicFontSize),
            textDirection: TextDirection.rtl,
          ),
        ],
      );

  Widget changeMushafFontSize() => Column(
        children: [
          const Text(
            'Mushaf Mode Font Size ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'me_quran'),
          ),
          const SizedBox(height: 15),
          Slider(
            min: 20,
            max: 50,
            activeColor: const Color.fromARGB(255, 56, 115, 59),
            value: mushafFontSize,
            onChanged: (value) {
              setState(() {
                mushafFontSize = value;
              });
            },
          ),
          Text(
            "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏",
            style: TextStyle(fontFamily: 'quran', fontSize: mushafFontSize),
            textDirection: TextDirection.rtl,
          ),
        ],
      );
}
