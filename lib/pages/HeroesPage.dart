import 'package:flutter/material.dart';
import 'package:marvel/views/HeroesPageView.dart';
import 'package:marvel/viewmodels/HeroesViewModel.dart';
import 'package:marvel/data/RemoteMarvelRepository.dart';


class HeroesPage extends StatefulWidget {
  @override
  State<HeroesPage> createState() => HeroesPageView();

}

abstract class HeroesPageState extends State<HeroesPage> {
  HeroesViewModel heroesViewModel;

  @override
  void initState() {
    super.initState();
    heroesViewModel = HeroesViewModel(marvelRepository: RemoteMarvelRepository());
    loadData();
  }

  Future loadData() async {
    await heroesViewModel.fetchHeroes(20, 0);
  }

}