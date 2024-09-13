import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';

class Supportcenter_Screen extends StatelessWidget {
  const Supportcenter_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width,
        ),
        const Text(
          "Under work",
          style: TextStyle(
            color: WhiteColor,
            fontFamily: SubFont,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
