import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/view/widget/ScaffoldWidget.dart';

class About_Screen extends StatelessWidget {
  const About_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyAndAppBarWidget(
      text: S.of(context).drawer_9,
      children: [
        const SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: SubColor.withOpacity(.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment:
                      IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    S.of(context).about_1,
                    style: const TextStyle(
                      color: PrimaryColor,
                      fontFamily: PrimaryFont,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment:
                      IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    S.of(context).about_2,
                    style: const TextStyle(
                      color: WhiteColor,
                      fontFamily: SubFont,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: SubColor.withOpacity(.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment:
                      IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    S.of(context).about_3,
                    style: const TextStyle(
                      color: PrimaryColor,
                      fontFamily: PrimaryFont,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment:
                      IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).about_4,
                              style: const TextStyle(
                                color: WhiteColor,
                                fontFamily: SubFont,
                                fontSize: 17,
                              ),
                            ),
                            const TextSpan(
                              text: "    kemetinfohub@gmail.com ",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: SubFont,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
