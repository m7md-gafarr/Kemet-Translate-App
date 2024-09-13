// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kemet`
  String get kemet {
    return Intl.message(
      'Kemet',
      name: 'kemet',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get intro_1 {
    return Intl.message(
      'SKIP',
      name: 'intro_1',
      desc: '',
      args: [],
    );
  }

  /// `SCROLL RIGHT`
  String get intro_2 {
    return Intl.message(
      'SCROLL RIGHT',
      name: 'intro_2',
      desc: '',
      args: [],
    );
  }

  /// `Kemet`
  String get intro_3_1_0 {
    return Intl.message(
      'Kemet',
      name: 'intro_3_1_0',
      desc: '',
      args: [],
    );
  }

  /// `Immerse yourself in the mysterious history and identity of Egypt.`
  String get intro_3_1_1 {
    return Intl.message(
      'Immerse yourself in the mysterious history and identity of Egypt.',
      name: 'intro_3_1_1',
      desc: '',
      args: [],
    );
  }

  /// `The best and the easiest`
  String get intro_3_2_0 {
    return Intl.message(
      'The best and the easiest',
      name: 'intro_3_2_0',
      desc: '',
      args: [],
    );
  }

  /// `Discover the ancient Egyptian scroll and unlock the secrets of hieroglyphics, Kemet provides an educational journey into the world of hieroglyphics and a translation tool from Arabic to ancient writing`
  String get intro_3_2_1 {
    return Intl.message(
      'Discover the ancient Egyptian scroll and unlock the secrets of hieroglyphics, Kemet provides an educational journey into the world of hieroglyphics and a translation tool from Arabic to ancient writing',
      name: 'intro_3_2_1',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get intro_4 {
    return Intl.message(
      'Get Started',
      name: 'intro_4',
      desc: '',
      args: [],
    );
  }

  /// `Translate`
  String get drawer_1 {
    return Intl.message(
      'Translate',
      name: 'drawer_1',
      desc: '',
      args: [],
    );
  }

  /// `Learn hieroglyphics`
  String get drawer_2 {
    return Intl.message(
      'Learn hieroglyphics',
      name: 'drawer_2',
      desc: '',
      args: [],
    );
  }

  /// `Control panel`
  String get drawer_3 {
    return Intl.message(
      'Control panel',
      name: 'drawer_3',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get drawer_4 {
    return Intl.message(
      'Favorites',
      name: 'drawer_4',
      desc: '',
      args: [],
    );
  }

  /// `Settings & Support`
  String get drawer_5 {
    return Intl.message(
      'Settings & Support',
      name: 'drawer_5',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawer_6 {
    return Intl.message(
      'Settings',
      name: 'drawer_6',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get drawer_7 {
    return Intl.message(
      'Privacy',
      name: 'drawer_7',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get drawer_8 {
    return Intl.message(
      'Help Center',
      name: 'drawer_8',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get drawer_9 {
    return Intl.message(
      'About',
      name: 'drawer_9',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get drawer_10 {
    return Intl.message(
      'Language',
      name: 'drawer_10',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get drawer_11 {
    return Intl.message(
      'Share App',
      name: 'drawer_11',
      desc: '',
      args: [],
    );
  }

  /// ` Language`
  String get drawer_12 {
    return Intl.message(
      ' Language',
      name: 'drawer_12',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get home_1_0 {
    return Intl.message(
      'Arabic',
      name: 'home_1_0',
      desc: '',
      args: [],
    );
  }

  /// `Hieroglyphics`
  String get home_1_1 {
    return Intl.message(
      'Hieroglyphics',
      name: 'home_1_1',
      desc: '',
      args: [],
    );
  }

  /// `Enter text`
  String get home_2 {
    return Intl.message(
      'Enter text',
      name: 'home_2',
      desc: '',
      args: [],
    );
  }

  /// `Translate`
  String get home_3 {
    return Intl.message(
      'Translate',
      name: 'home_3',
      desc: '',
      args: [],
    );
  }

  /// `Text copied to clipboard`
  String get home_4 {
    return Intl.message(
      'Text copied to clipboard',
      name: 'home_4',
      desc: '',
      args: [],
    );
  }

  /// `Browse Images`
  String get camera_1 {
    return Intl.message(
      'Browse Images',
      name: 'camera_1',
      desc: '',
      args: [],
    );
  }

  /// `Take Image`
  String get camera_2 {
    return Intl.message(
      'Take Image',
      name: 'camera_2',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get share_1 {
    return Intl.message(
      'Close',
      name: 'share_1',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share_2 {
    return Intl.message(
      'Share',
      name: 'share_2',
      desc: '',
      args: [],
    );
  }

  /// `Number of site users`
  String get control_panal_1 {
    return Intl.message(
      'Number of site users',
      name: 'control_panal_1',
      desc: '',
      args: [],
    );
  }

  /// `Number of words translated`
  String get control_panal_2 {
    return Intl.message(
      'Number of words translated',
      name: 'control_panal_2',
      desc: '',
      args: [],
    );
  }

  /// `Number of images uploaded`
  String get control_panal_3 {
    return Intl.message(
      'Number of images uploaded',
      name: 'control_panal_3',
      desc: '',
      args: [],
    );
  }

  /// `From last week`
  String get control_panal_3_1_2_3 {
    return Intl.message(
      'From last week',
      name: 'control_panal_3_1_2_3',
      desc: '',
      args: [],
    );
  }

  /// `Most translated words`
  String get control_panal_4 {
    return Intl.message(
      'Most translated words',
      name: 'control_panal_4',
      desc: '',
      args: [],
    );
  }

  /// `Number of daily translations`
  String get control_panal_5 {
    return Intl.message(
      'Number of daily translations',
      name: 'control_panal_5',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get control_panal_6 {
    return Intl.message(
      'Sunday',
      name: 'control_panal_6',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get control_panal_7 {
    return Intl.message(
      'Monday',
      name: 'control_panal_7',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get control_panal_8 {
    return Intl.message(
      'Tuesday',
      name: 'control_panal_8',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get control_panal_9 {
    return Intl.message(
      'Wednesday',
      name: 'control_panal_9',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get control_panal_10 {
    return Intl.message(
      'Thursday',
      name: 'control_panal_10',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get control_panal_11 {
    return Intl.message(
      'Friday',
      name: 'control_panal_11',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get control_panal_12 {
    return Intl.message(
      'Saturday',
      name: 'control_panal_12',
      desc: '',
      args: [],
    );
  }

  /// `You’re offline`
  String get nointernet_1 {
    return Intl.message(
      'You’re offline',
      name: 'nointernet_1',
      desc: '',
      args: [],
    );
  }

  /// `Please connect to the internet and try again`
  String get nointernet_2 {
    return Intl.message(
      'Please connect to the internet and try again',
      name: 'nointernet_2',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get nointernet_3 {
    return Intl.message(
      'Retry',
      name: 'nointernet_3',
      desc: '',
      args: [],
    );
  }

  /// `We are a team of four individuals working to provide an easy and enjoyable experience for translating texts from Arabic to Hieroglyphics.`
  String get about_1 {
    return Intl.message(
      'We are a team of four individuals working to provide an easy and enjoyable experience for translating texts from Arabic to Hieroglyphics.',
      name: 'about_1',
      desc: '',
      args: [],
    );
  }

  /// `Our project aims to help users translate and understand Hieroglyphics in simple ways. In the future, we plan to add new features such as interactive training tools and a library containing famous ancient texts in Hieroglyphics along with their translations.`
  String get about_2 {
    return Intl.message(
      'Our project aims to help users translate and understand Hieroglyphics in simple ways. In the future, we plan to add new features such as interactive training tools and a library containing famous ancient texts in Hieroglyphics along with their translations.',
      name: 'about_2',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get about_3 {
    return Intl.message(
      'Contact Us',
      name: 'about_3',
      desc: '',
      args: [],
    );
  }

  /// `For inquiries or suggestions, reach out to us via email:`
  String get about_4 {
    return Intl.message(
      'For inquiries or suggestions, reach out to us via email:',
      name: 'about_4',
      desc: '',
      args: [],
    );
  }

  /// `You have not added your favorite translation yet.`
  String get fav_1 {
    return Intl.message(
      'You have not added your favorite translation yet.',
      name: 'fav_1',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
