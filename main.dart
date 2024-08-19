
import 'package:flutter/material.dart';
import 'package:islami_project/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_project/home/quran/sura_details_screen.dart';
import 'package:islami_project/home_screen.dart';
import 'package:islami_project/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'home/radio/radio_details_screen.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        RadioDetailsScreen.routeName: (context) => RadioDetailsScreen()

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightTheme,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }
}
