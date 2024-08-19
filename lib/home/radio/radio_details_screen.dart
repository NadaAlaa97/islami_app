import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/home/hadeth/hadeth_tab.dart';
import 'package:islami_project/home/hadeth/item_hadeth_details.dart';
import 'package:islami_project/home/quran/item_sura_details.dart';
import 'package:islami_project/my_theme.dart';

class RadioDetailsScreen extends StatefulWidget {
  static const String routeName = 'radio_details';

  @override
  State<RadioDetailsScreen> createState() => _RadioDetailsScreenState();
}

class _RadioDetailsScreenState extends State<RadioDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        'assets/images/main_bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.06
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: MyTheme.whiteColor,


          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetails(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }

}


