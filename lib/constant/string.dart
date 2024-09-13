import 'dart:ui';
import 'package:intl/intl.dart';

const IntroScreen = '/IntroScreen';
const HomeScreen = '/';
const CameraScreen = "/CameraScreen";
const LearnHeroScreen = "/learnHeroScreen";
const ControlPanalScreen = "/ControlPanalScreen";
const FavoriteScreen = "/FavoriteScreen";
const SettingScreen = "/SettingScreen";
const PrivecyScreen = "/PrivecyScreen";
const SupportCenterScreen = "/SupportCenterScreen";
const AboutScreen = "/learnAboutScreenHeroScreen";

////////////////////////////////////////////////

const HiveBox = "FavTranslate";

///////////////////////////////////////////////////

const Color PrimaryColor = Color(0xfffdbb5e);
const Color SubColor = Color(0xff161b1f);
const Color WhiteColor = Color.fromARGB(255, 255, 255, 255);
const Color SubdarkColor = Color(0xff3e4f57);

////////////////////////////////////////////////

const String PrimaryFont = "Readex";
const String SubFont = "Cairo";

////////////////////////////////////////////////

const String ApiKey = "http://10.0.2.2:5000";
// const String ApiKey = "https://kemet-ara-eng-d85608881812.herokuapp.com";

////////////////////////////////////////////////

bool IsArabic() {
  return Intl.getCurrentLocale() == "ar";
}

/////////////////////////////////////////////////
var CurrentPage = DeawerListWidget.Translate;

enum DeawerListWidget {
  Translate,
  Learnhero,
  ControlPanal,
  History,
  Setting,
  Privecy,
  SupportCenter,
  WeAbout,
  Language,
  AppShare,
}
