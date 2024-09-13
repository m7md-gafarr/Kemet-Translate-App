import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kemet_translate/state%20management/bloc/translate/translate_cubit_cubit.dart';
import 'package:kemet_translate/constant/string.dart';
import 'package:kemet_translate/generated/l10n.dart';
import 'package:kemet_translate/state%20management/provider/language.dart';
import 'package:kemet_translate/view/app_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? _seen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box = await Hive.openBox<List>(HiveBox);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _seen = prefs.getBool("intro");
  final languageProvider = LanguageProvider();
  await languageProvider.ReadLanguageAndSelected();
  runApp(
    ChangeNotifierProvider<LanguageProvider>(
      create: (context) => languageProvider,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TranslateCubit(),
          ),
        ],
        child: KemetTranslateApp(appRouter: AppRouter()),
      ),
    ),
  );
}

class KemetTranslateApp extends StatelessWidget {
  const KemetTranslateApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          locale: Locale(
              Provider.of<LanguageProvider>(context, listen: true).language),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: appRouter.generate_route,
          initialRoute: _seen == true ? HomeScreen : IntroScreen,
          // home: const TestScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
