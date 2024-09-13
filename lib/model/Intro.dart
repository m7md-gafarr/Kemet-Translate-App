import 'package:flutter/material.dart';
import 'package:kemet_translate/generated/l10n.dart';

class IntroModel {
  final String path;
  final String PrimaryText;
  final String SubText;
  IntroModel(
      {required this.PrimaryText, required this.SubText, required this.path});

  static List<IntroModel> IntroData(BuildContext context) {
    return [
      IntroModel(
        PrimaryText: S.of(context).intro_3_1_0,
        SubText: S.of(context).intro_3_1_1,
        path: "assets/image/logo.svg",
      ),
      IntroModel(
        PrimaryText: S.of(context).intro_3_2_0,
        SubText: S.of(context).intro_3_2_1,
        path: "assets/image/PH.svg",
      ),
    ];
  }
}
