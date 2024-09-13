import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kemet_translate/constant/string.dart';

class TextOrImageWidget extends StatelessWidget {
  const TextOrImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: WhiteColor.withOpacity(.3),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(color: WhiteColor, width: 1),
            ),
            child: const Icon(Iconsax.text),
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: WhiteColor.withOpacity(.3),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(color: WhiteColor, width: 1),
            ),
            child: const Icon(Iconsax.text),
          )
        ],
      ),
    );
  }
}
