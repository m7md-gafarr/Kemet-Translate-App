import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kemet_translate/generated/l10n.dart';

import '../../constant/string.dart';

class CheckInternetWidget extends StatelessWidget {
  CheckInternetWidget({super.key, required this.onPressed});
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 2 - 220),
        SvgPicture.asset(
          "assets/image/no internet.svg",
          color: Colors.red,
          height: MediaQuery.of(context).size.width / 4,
        ),
        const SizedBox(height: 20),
        Text(
          S.of(context).nointernet_1,
          style: const TextStyle(
            color: WhiteColor,
            fontSize: 22,
            fontFamily: PrimaryFont,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          S.of(context).nointernet_2,
          style: const TextStyle(
              color: WhiteColor,
              fontSize: 18,
              fontFamily: SubFont,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: PrimaryColor,
            fixedSize: Size(MediaQuery.of(context).size.width / 2 - 16, 50),
          ),
          child: AutoSizeText(
            S.of(context).nointernet_3,
            style: const TextStyle(
              color: SubColor,
              fontFamily: SubFont,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
