import 'package:flutter/material.dart';
import 'package:marvel/views/HeroPageView.dart';
import 'package:marvel/models/Hero.dart' as Marvel;

class HeroPage extends StatefulWidget {
  Marvel.Hero hero;
  HeroPage(Marvel.Hero hero) : this.hero = hero;

  @override
  State<HeroPage> createState() => HeroPageView(this.hero);

}

abstract class HeroPageState extends State<HeroPage> {
  Marvel.Hero hero;
  HeroPageState(Marvel.Hero hero) : this.hero = hero;
}