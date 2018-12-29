import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class ComingSoonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Expanded(
      child: FlareActor(
        "assets/Filip.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "united",
      ));

}