import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/model/dashboard.dart';
import 'package:kemet_translate/state%20management/bloc/Check%20connection/check_connection_cubit.dart';
import 'package:kemet_translate/view/widget/CheckinternetWidget.dart';
import 'package:kemet_translate/view/widget/ScaffoldWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ControlPanal_Screen extends StatefulWidget {
  const ControlPanal_Screen({super.key});

  @override
  State<ControlPanal_Screen> createState() => _ControlPanal_ScreenState();
}

class _ControlPanal_ScreenState extends State<ControlPanal_Screen> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y',
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
      builder: (context, state) {
        if (state is CheckConnectionHasInternet) {
          return BodyAndAppBarWidget(
            text: S.of(context).drawer_3,
            children: [
              const SizedBox(height: 20),
              _ContainerData(
                  context, Iconsax.user, S.of(context).control_panal_1, 33, 60),
              const SizedBox(height: 20),
              _ContainerData(context, Iconsax.text,
                  S.of(context).control_panal_2, 985, 85),
              const SizedBox(height: 20),
              _ContainerData(context, Iconsax.image,
                  S.of(context).control_panal_3, 30, 35),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: SubColor.withOpacity(.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SfCartesianChart(
                  plotAreaBorderColor: Colors.transparent,
                  tooltipBehavior: _tooltip,
                  primaryXAxis: const CategoryAxis(
                      labelStyle: TextStyle(color: WhiteColor),
                      majorGridLines: MajorGridLines(width: 0)),
                  primaryYAxis: const NumericAxis(
                      labelStyle: TextStyle(color: WhiteColor),
                      minimum: 0,
                      maximum: 100,
                      interval: 10,
                      majorGridLines: MajorGridLines(width: 0)),
                  title: ChartTitle(
                      text: S.of(context).control_panal_4,
                      textStyle: const TextStyle(
                          color: PrimaryColor,
                          fontFamily: PrimaryFont,
                          fontWeight: FontWeight.w500)),
                  legend: const Legend(
                      isVisible: true,
                      textStyle:
                          TextStyle(color: WhiteColor, fontFamily: SubFont)),
                  series: <CartesianSeries<MostText, String>>[
                    ColumnSeries<MostText, String>(
                      color: PrimaryColor,
                      dataSource: <MostText>[
                        MostText(Text: 'محمد', Count: 100),
                        MostText(Text: 'مصطفى', Count: 80),
                        MostText(Text: 'سيد', Count: 60),
                        MostText(Text: 'جعفر', Count: 20),
                        MostText(Text: 'مصر', Count: 10),
                      ],
                      xValueMapper: (MostText sales, _) => sales.Text,
                      yValueMapper: (MostText sales, _) => sales.Count,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: SubColor.withOpacity(.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SfCircularChart(
                  title: ChartTitle(
                    text: S.of(context).control_panal_5,
                    textStyle: const TextStyle(
                        color: PrimaryColor,
                        fontFamily: PrimaryFont,
                        fontWeight: FontWeight.w500),
                  ),
                  tooltipBehavior: _tooltip,
                  legend: const Legend(
                    isVisible: true,
                    textStyle: TextStyle(
                      color: WhiteColor,
                      fontFamily: SubFont,
                    ),
                  ),
                  series: <CircularSeries>[
                    RadialBarSeries<MostTranslateInday, String>(
                      dataSource: <MostTranslateInday>[
                        MostTranslateInday(
                            day: S.of(context).control_panal_6, Count: 35),
                        MostTranslateInday(
                            day: S.of(context).control_panal_7, Count: 28),
                        MostTranslateInday(
                            day: S.of(context).control_panal_8, Count: 34),
                        MostTranslateInday(
                            day: S.of(context).control_panal_9, Count: 32),
                        MostTranslateInday(
                            day: S.of(context).control_panal_10, Count: 40),
                        MostTranslateInday(
                            day: S.of(context).control_panal_11, Count: 25),
                        MostTranslateInday(
                            day: S.of(context).control_panal_12, Count: 30),
                      ],
                      xValueMapper: (MostTranslateInday sales, _) => sales.day,
                      yValueMapper: (MostTranslateInday sales, _) =>
                          sales.Count,
                      cornerStyle: CornerStyle.endCurve,
                      enableTooltip: true,
                      opacity: 1,
                      trackOpacity: .2,
                      useSeriesColor: true,
                      maximumValue: 50,
                    ),
                  ],
                ),
              )
            ],
          );
        } else if (state is CheckConnectionNoInternet) {
          return BodyAndAppBarWidget(
            text: S.of(context).drawer_3,
            children: [
              CheckInternetWidget(
                onPressed: () {
                  context
                      .read<CheckConnectionCubit>()
                      .checkInitialConnectivity();
                },
              ),
            ],
          );
        } else {
          return BodyAndAppBarWidget(
              text: S.of(context).drawer_3,
              children: const [Center(child: CircularProgressIndicator())]);
        }
      },
    );
  }
}

Widget _ContainerData(
    BuildContext context, IconData? icon, String title, int count, int ratio) {
  return Container(
    padding: const EdgeInsets.all(8),
    height: 110,
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
            Text(
              title,
              style: const TextStyle(
                color: PrimaryColor,
                fontFamily: PrimaryFont,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Icon(
              icon,
              color: WhiteColor,
            )
          ],
        ),
        const Spacer(),
        Align(
          alignment: IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            "$count +",
            style: const TextStyle(
              color: WhiteColor,
              fontFamily: SubFont,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: IsArabic() ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            "$ratio%+ ${S.of(context).control_panal_3_1_2_3}",
            style: const TextStyle(
              color: WhiteColor,
              fontFamily: SubFont,
              fontSize: 17,
            ),
          ),
        )
      ],
    ),
  );
}
