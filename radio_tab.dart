import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Radiotab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(AppLocalizations.of(context)!.radio_of_the_holy_quran,
          style: Theme.of(context).textTheme.titleSmall),),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Image.asset('assets/images/buttons.png'),
        ),


      ],

    );
  }
}
