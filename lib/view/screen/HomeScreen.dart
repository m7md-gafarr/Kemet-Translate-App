import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/model/translate.dart';
import 'package:kemet_translate/state%20management/provider/language.dart';
import 'package:kemet_translate/view/screen/TranslateScreen.dart';

import 'package:kemet_translate/view/widget/CheckinternetWidget.dart';
import 'package:kemet_translate/view/widget/ListDeawerWidget.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TranslateModel? translateModel;
  @override
  void initState() {
    super.initState();
    CheckConnectivity();
  }

  void CheckConnectivity() async {
    await Connectivity().checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              SubdarkColor,
              SubColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StreamBuilder<ConnectivityResult>(
              stream: Connectivity()
                  .onConnectivityChanged
                  .map((event) => event.first),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != ConnectivityResult.none) {
                  return const Translate_Screen();
                } else {
                  return CheckInternetWidget(
                    onPressed: CheckConnectivity,
                  );
                }
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: SubdarkColor,
        title: SvgPicture.asset(
          "assets/image/logo.svg",
          height: 80,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Provider.of<LanguageProvider>(context).language == "ar"
                    ? FluentIcons.list_rtl_20_filled
                    : FluentIcons.list_20_filled,
                color: WhiteColor,
              )),
        ),
      ),
      drawer: Drawer(
        backgroundColor: SubdarkColor,
        width: MediaQuery.of(context).size.width - 100,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const ListDrawerWidget(),
            ),
          ),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 4,
    );
  }
}
