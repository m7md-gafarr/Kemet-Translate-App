import 'package:flutter/material.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/view/screen/AboutScreen.dart';
import 'package:kemet_translate/view/screen/CamreaScreen.dart';
import 'package:kemet_translate/view/screen/ControlPanelScreen.dart';
import 'package:kemet_translate/view/screen/FavoritesScreen.dart';
import 'package:kemet_translate/view/screen/HomeScreen.dart';
import 'package:kemet_translate/view/screen/IntroScreen.dart';
import 'package:kemet_translate/view/screen/LearnHeroScreen.dart';
import 'package:kemet_translate/view/screen/PrivecyScreen.dart';
import 'package:kemet_translate/view/screen/SettingScreen.dart';
import 'package:kemet_translate/view/screen/SupportCenterScreen.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      case IntroScreen:
        return MaterialPageRoute(builder: (_) => const Intro_Screen());
      case HomeScreen:
        return MaterialPageRoute(builder: (_) => const Home_Screen());
      case CameraScreen:
        return MaterialPageRoute(builder: (_) => const Camera_Screen());
      case LearnHeroScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LearnHero_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case ControlPanalScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ControlPanal_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case FavoriteScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Favorites_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case SettingScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Setting_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case PrivecyScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Privecy_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case SupportCenterScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Supportcenter_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case AboutScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const About_Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: IsArabic()
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Not found this Screen"),
            ),
          ),
        );
    }
  }
}
