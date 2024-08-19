import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../my_theme.dart';

class Sebhatab extends StatefulWidget {
  @override
  _SebhatabState createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab>
    with SingleTickerProviderStateMixin {
  int count = 0;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _increaseCount() {
    setState(() {
      count++;
      _animationController?.reset();
      _animationController?.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 90, bottom: 90, left: 190),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/head_of_seb7a.png',
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(80),
              child: RotationTransition(
                turns: _animationController!,
                child: Image.asset('assets/images/body_of_seb7a.png'),
              ),
            ),
          ],
        ),
        Text(
          AppLocalizations.of(context)!.the_number_of_praises,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffd0b083),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: ElevatedButton(
            onPressed: () {
              _increaseCount();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                count <= 33
                    ? AppLocalizations.of(context)!.subhan_allah
                    : count <= 60
                    ? AppLocalizations.of(context)!.alhamdullah
                    : AppLocalizations.of(context)!.allah_akbar,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
