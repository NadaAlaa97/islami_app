import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/providers/app_config_provider.dart';
import 'package:islami_project/settings/language_bottom_sheet.dart';
import 'package:islami_project/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage == 'en'?
                    AppLocalizations.of(context)!.english
                    :AppLocalizations.of(context)!.arabic,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,

                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarkMode()?
                  AppLocalizations.of(context)!.dark
                      :AppLocalizations.of(context)!.light,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,

                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder:(context) => LanguageBottomSheet()
    );
  }


void showThemeBottomSheet() {
showModalBottomSheet(context: context,
    builder: (context) => ThemeBottomSheet()
);
  }
}
