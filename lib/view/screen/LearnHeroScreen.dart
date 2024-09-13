import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/model/lernHero.dart';
import 'package:kemet_translate/view/widget/ScaffoldWidget.dart';

class LearnHero_Screen extends StatelessWidget {
  const LearnHero_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyAndAppBarWidget(
      text: S.of(context).drawer_2,
      children: [
        const SizedBox(height: 20),
        const Text(
          "العلامات الأحاديه هي العلامات التي تستخدم للتعبير عن صوت واحد وهي الأكثر شيوعاً في الكتابة الهيروغليفية",
          style: TextStyle(
            color: WhiteColor,
            fontFamily: SubFont,
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: SubColor.withOpacity(.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  "الدلالة التصويرية",
                  style: TextStyle(
                      color: PrimaryColor, fontWeight: FontWeight.w600),
                )),
                DataColumn(
                    label: Text(
                  "منطوقها بالعربية",
                  style: TextStyle(
                      color: PrimaryColor, fontWeight: FontWeight.w600),
                )),
                DataColumn(
                  label: Text(
                    "العلامة",
                    style: TextStyle(
                        color: PrimaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
              rows: LearnHeroModel.data
                  .map(
                    (e) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(
                            e.FigurativeMeaning,
                            style: const TextStyle(color: WhiteColor),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              e.PronouncedArabic,
                              style: const TextStyle(color: WhiteColor),
                            ),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              e.Sign,
                              style: const TextStyle(color: WhiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
