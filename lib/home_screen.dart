import 'package:flutter/material.dart';
import 'package:islami_project/home/hadeth/hadeth_tab.dart';
import 'package:islami_project/home/quran/quran_tab.dart';
import 'package:islami_project/home/radio/radio_tab.dart';
import 'package:islami_project/home/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/providers/app_config_provider.dart';
import 'package:islami_project/settings/settings_tab.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
          :
        Image.asset('assets/images/main_bg.png',
        width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/quran.png')
                    ),
                  label: AppLocalizations.of(context)!.quran
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/ahadeth_icon.png')
                    ),
                    label: AppLocalizations.of(context)!.hadeth
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/sebha.png')
                    ),
                    label: AppLocalizations.of(context)!.sebha
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/radio_icon.png')
                    ),
                    label: AppLocalizations.of(context)!.radio
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs = [
    Qurantab(),Hadethtab(),Sebhatab(),Radiotab(),SettingsTab()
  ];
}
