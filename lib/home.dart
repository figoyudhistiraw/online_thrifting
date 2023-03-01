import 'package:flutter/material.dart';
import 'show.dart';
import 'cardWidget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            cardPost(context),
            cardPost(context),
            cardPost(context),
          ],
        ),
      ],
    );
  }
}
