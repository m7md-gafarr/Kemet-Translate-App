import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/state%20management/provider/language.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ListDrawerWidget extends StatefulWidget {
  const ListDrawerWidget({super.key});

  @override
  State<ListDrawerWidget> createState() => _ListDrawerWidgetState();
}

class _ListDrawerWidgetState extends State<ListDrawerWidget> {
// Future<void> shareImageFromAssets(String assetPath) async {
//   try {
//     final byteData = await rootBundle.load(assetPath);
//     final buffer = byteData.buffer.asUint8List();

//     final directory = await getTemporaryDirectory();
//     final filePath = '${directory.path}/shared_image.png';

//     final file = File(filePath);
//     await file.writeAsBytes(buffer);

//     // تحقق من أن الصورة تم حفظها بشكل صحيح
//     if (await file.exists()) {
//       await Share.shareFiles([filePath], text: "Check out this image!");
//     } else {
//       print("File not found at $filePath");
//     }
//   } catch (e) {
//     print("Error sharing image: $e");
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: IsArabic() ? 0 : 15,
              right: IsArabic() ? 15 : 0,
              top: 20,
              bottom: 20,
            ),
            child: Text(
              S.of(context).kemet,
              style: TextStyle(
                color: PrimaryColor,
                fontFamily: PrimaryFont,
                fontWeight: FontWeight.w600,
                letterSpacing: IsArabic() ? 0 : 2,
                fontSize: 27,
              ),
            ),
          ),
        ),
        const Divider(),
        _ExpandableTile(
          icon: Iconsax.language_square,
          Label: S.of(context).drawer_2,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, LearnHeroScreen);
          },
        ),
        _ExpandableTile(
          icon: Iconsax.chart_1,
          Label: S.of(context).drawer_3,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, ControlPanalScreen);
          },
        ),
        _ExpandableTile(
          icon: Iconsax.lovely,
          Label: S.of(context).drawer_4,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, FavoriteScreen);
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        ExpansionTile(
          shape: const Border(),
          title: AutoSizeText(
            S.of(context).drawer_5,
            style: const TextStyle(
              color: WhiteColor,
              fontFamily: PrimaryFont,
              fontSize: 18,
            ),
            maxLines: 1,
          ),
          children: [
            _ExpandableTile(
              icon: Iconsax.setting_2,
              Label: S.of(context).drawer_6,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SettingScreen);
              },
            ),
            _ExpandableTile(
              icon: Iconsax.security_user4,
              Label: S.of(context).drawer_7,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, PrivecyScreen);
              },
            ),
            _ExpandableTile(
              icon: Iconsax.message_question4,
              Label: S.of(context).drawer_8,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SupportCenterScreen);
              },
            ),
          ],
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        _ExpandableTile(
          icon: Iconsax.information,
          Label: S.of(context).drawer_9,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AboutScreen);
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        _ExpandableTile(
          icon: Iconsax.setting_4,
          Label: S.of(context).drawer_10,
          onTap: () {
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Builder(builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 4 - 20,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: SubdarkColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: IsArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(
                              S.of(context).drawer_12,
                              style: const TextStyle(
                                color: WhiteColor,
                                fontFamily: SubFont,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListTile(
                            trailing: context.read<LanguageProvider>().selected
                                ? const Text("")
                                : const Icon(
                                    Iconsax.tick_circle,
                                    color: Colors.green,
                                  ),
                            onTap: () {
                              Provider.of<LanguageProvider>(context,
                                      listen: false)
                                  .ChangeLanguageToAR();
                              Navigator.pop(context);
                            },
                            title: const Text(
                              "عربى",
                              style: TextStyle(
                                color: WhiteColor,
                                fontFamily: SubFont,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            trailing: context.read<LanguageProvider>().selected
                                ? const Icon(
                                    Iconsax.tick_circle,
                                    color: Colors.green,
                                  )
                                : const Text(""),
                            onTap: () {
                              Provider.of<LanguageProvider>(context,
                                      listen: false)
                                  .ChangeLanguageToEN();

                              Navigator.pop(context);
                            },
                            title: const Text(
                              "English",
                              style: TextStyle(
                                color: WhiteColor,
                                fontFamily: SubFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          },
        ),
        _ExpandableTile(
          icon: Iconsax.share,
          Label: S.of(context).drawer_11,
          onTap: () {
            Navigator.pop(context);
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Builder(
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 4 - 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: SubdarkColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await Share.share(
                                        "https://www.mediafire.com/file/fjufr0wq315hlim/Kemet_Translate.apk/file");
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      color: SubColor.withOpacity(.5),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: const Icon(
                                      Iconsax.link,
                                      color: WhiteColor,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: SubdarkColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(height: 20),
                                                Image.asset(
                                                    "assets/image/qr-code.png"),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            PrimaryColor,
                                                        fixedSize:
                                                            const Size(100, 40),
                                                      ),
                                                      child: Text(
                                                        S.of(context).share_1,
                                                        style: const TextStyle(
                                                          color: SubColor,
                                                          fontFamily: SubFont,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    // ElevatedButton(
                                                    //   onPressed: () async {
                                                    //     Image                                                      },
                                                    //   style: ElevatedButton
                                                    //       .styleFrom(
                                                    //     backgroundColor:
                                                    //         PrimaryColor,
                                                    //     fixedSize:
                                                    //         const Size(100, 40),
                                                    //   ),
                                                    //   child: Text(
                                                    //     S.of(context).share_2,
                                                    //     style: const TextStyle(
                                                    //       color: SubColor,
                                                    //       fontFamily: SubFont,
                                                    //       fontSize: 18,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      color: SubColor.withOpacity(.5),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: const Icon(
                                      Iconsax.barcode,
                                      color: WhiteColor,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _ExpandableTile({
    required IconData icon,
    required String Label,
    required void Function() onTap,
  }) {
    return ListTile(
      selectedTileColor: WhiteColor.withOpacity(.2),
      onTap: onTap,
      leading: Icon(
        icon,
        color: WhiteColor,
        size: 22,
      ),
      title: AutoSizeText(
        Label,
        style: const TextStyle(
          color: WhiteColor,
          fontFamily: PrimaryFont,
          fontSize: 17,
        ),
        maxLines: 1,
      ),
    );
  }
}
