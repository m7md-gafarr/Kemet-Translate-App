import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.hintText,
    required this.readOnly,
    required this.textAlign,
    required this.controller,
    required this.onChanged,
  });
  String hintText;
  bool readOnly;
  TextAlign textAlign;
  TextEditingController controller;
  void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        textAlign: textAlign,
        onChanged: onChanged,
        controller: controller,
        readOnly: readOnly,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        minLines: 1,
        maxLines: 20,
        style: const TextStyle(
          color: WhiteColor,
          fontFamily: SubFont,
        ),
        cursorRadius: const Radius.circular(50),
        keyboardType: TextInputType.text,
        cursorColor: WhiteColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: WhiteColor,
            fontFamily: SubFont,
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
