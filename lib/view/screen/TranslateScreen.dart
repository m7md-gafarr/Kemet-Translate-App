import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/state%20management/bloc/translate/translate_cubit_cubit.dart';
import 'package:kemet_translate/view/widget/TextFieldWidget.dart';
import 'package:share_plus/share_plus.dart';

class Translate_Screen extends StatefulWidget {
  const Translate_Screen({super.key});

  @override
  State<Translate_Screen> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<Translate_Screen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _visible = false;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: WhiteColor.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
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
                            top: 17,
                            right: IsArabic() ? 16.0 : 0,
                            left: IsArabic() ? 0 : 16),
                        child: Text(
                          S.of(context).home_1_0,
                          style: const TextStyle(
                            color: WhiteColor,
                            fontSize: 22,
                            fontFamily: PrimaryFont,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: _visible,
                      child: IconButton(
                        onPressed: () {
                          _controller1.text = "";
                          _controller2.text = "";
                          setState(() {
                            _visible = false;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: WhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFieldWidget(
                  hintText: S.of(context).home_2,
                  readOnly: false,
                  controller: _controller1,
                  textAlign: IsArabic() ? TextAlign.right : TextAlign.left,
                  onChanged: (p0) {
                    if (_controller1.text != "") {
                      BlocProvider.of<TranslateCubit>(context)
                          .TranslateFunText(arabicText: p0);
                      setState(() {
                        _visible = true;
                      });
                    } else {
                      _controller2.text = "";
                      setState(() {
                        _visible = false;
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          final result =
                              await Navigator.pushNamed(context, CameraScreen);

                          if (result != null) {
                            setState(() {
                              _controller1.text = result.toString();
                              _visible = true;
                            });
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: WhiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Iconsax.camera,
                              color: SubColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: WhiteColor.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 17,
                ),
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
                          S.of(context).home_1_1,
                          style: const TextStyle(
                            color: WhiteColor,
                            fontSize: 22,
                            fontFamily: PrimaryFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocConsumer<TranslateCubit, TranslateCubitState>(
                  listener: (context, state) {
                    if (state is TranslateCubitSuccess) {
                      _controller2.text = state.translateModel.Hieroglyphics;
                    } else if (state is TranslateCubitFailear) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          width: 200,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 20,
                            right: 20,
                            left: 20,
                          ),
                          content: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: SubColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Center(
                              child: Text(
                                state.ErrorMessage,
                                style: const TextStyle(
                                  color: WhiteColor,
                                  fontFamily: SubFont,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    print("Rebuild Textfield");
                    return TextFieldWidget(
                      textAlign: IsArabic() ? TextAlign.left : TextAlign.right,
                      hintText: "",
                      readOnly: true,
                      controller: _controller2,
                      onChanged: (p0) {},
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            if (_controller2.text.isNotEmpty) {
                              Clipboard.setData(
                                  ClipboardData(text: _controller2.text));
                            }
                          },
                          icon: const Icon(
                            Iconsax.copy,
                            color: WhiteColor,
                          )),
                      IconButton(
                        onPressed: () async {
                          if (_controller2.text.isNotEmpty) {
                            await Share.share(_controller2.text);
                          }
                        },
                        icon: const Icon(
                          Iconsax.share,
                          color: WhiteColor,
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            Box box = Hive.box<List>(HiveBox);
                            if (_controller1.text.isNotEmpty) {
                              box.add([_controller1.text, _controller2.text]);
                              _controller2.text = "";
                              _controller1.text = "";
                              _visible = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom +
                                        20,
                                    right: 100,
                                    left: 100,
                                  ),
                                  content: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                      color: SubColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "تم اضافتها",
                                        style: TextStyle(
                                          color: WhiteColor,
                                          fontFamily: SubFont,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Iconsax.star,
                            color: WhiteColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
