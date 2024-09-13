import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/view/widget/ScaffoldWidget.dart';
import 'package:share_plus/share_plus.dart';

class Favorites_Screen extends StatefulWidget {
  const Favorites_Screen({super.key});

  @override
  State<Favorites_Screen> createState() => _Favorites_ScreenState();
}

class _Favorites_ScreenState extends State<Favorites_Screen> {
  List ViewTranslate = [];
  @override
  void initState() {
    Box box = Hive.box<List>(HiveBox);
    ViewTranslate = box.values.toList().reversed.toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BodyAndAppBarWidget(
      text: S.of(context).drawer_4,
      children: ViewTranslate.isEmpty
          ? [
              SizedBox(height: MediaQuery.of(context).size.width),
              Text(
                S.of(context).fav_1,
                style: const TextStyle(
                  color: WhiteColor,
                  fontSize: 18,
                  fontFamily: PrimaryFont,
                ),
                textAlign: TextAlign.center,
              ),
            ]
          : ViewTranslate.asMap().entries.map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: SubColor.withOpacity(.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: IsArabic()
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: IsArabic() ? 16.0 : 0,
                                      left: IsArabic() ? 0 : 16),
                                  child: Text(
                                    S.of(context).home_1_0,
                                    style: const TextStyle(
                                      color: PrimaryColor,
                                      fontSize: 20,
                                      fontFamily: PrimaryFont,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Iconsax.share),
                                onPressed: () async {
                                  await Share.share(e.value[1]);
                                },
                                color: WhiteColor,
                              ),
                              IconButton(
                                icon: const Icon(Iconsax.bag_cross_1),
                                onPressed: () {
                                  Box box = Hive.box<List>(HiveBox);
                                  box.deleteAt(
                                      ViewTranslate.length - 1 - e.key);
                                  setState(() {
                                    ViewTranslate =
                                        box.values.toList().reversed.toList();
                                  });
                                },
                                color: WhiteColor,
                              ),
                            ],
                          ),
                          Align(
                            alignment: IsArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: IsArabic() ? 16.0 : 0,
                                  left: IsArabic() ? 0 : 16),
                              child: Text(
                                e.value[0],
                                style: const TextStyle(
                                  color: WhiteColor,
                                  fontSize: 18,
                                  fontFamily: PrimaryFont,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: IsArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: IsArabic() ? 16.0 : 0,
                                  left: IsArabic() ? 0 : 16),
                              child: Text(
                                S.of(context).home_1_1,
                                style: const TextStyle(
                                  color: PrimaryColor,
                                  fontSize: 20,
                                  fontFamily: PrimaryFont,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: IsArabic()
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: IsArabic() ? 16.0 : 0,
                                  left: IsArabic() ? 0 : 16),
                              child: Text(
                                e.value[1],
                                style: const TextStyle(
                                  color: WhiteColor,
                                  fontSize: 18,
                                  fontFamily: PrimaryFont,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
            ).toList(),
    );
  }
}
