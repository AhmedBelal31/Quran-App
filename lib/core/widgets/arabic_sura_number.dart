import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';



class ArabicSuraNumber extends StatelessWidget {
   const ArabicSuraNumber({Key? key,required this.i}) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumbers = ArabicNumbers();


    return Text("\uFD3E"+arabicNumbers.convert(i+1)+"\uFD3F",  style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'me_quran',
        fontSize: 20,
        shadows: [
          Shadow(
            offset: Offset(.5, .5),
            blurRadius: 1.0,
            color: Colors.amberAccent,
          ),
        ]),);
  }
}
