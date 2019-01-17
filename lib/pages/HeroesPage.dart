import 'package:flutter/material.dart';
import 'package:marvel/views/HeroesPageView.dart';
import 'package:marvel/viewmodels/HeroesViewModel.dart';
import 'package:marvel/data/RemoteMarvelRepository.dart';
import 'package:marvel/models/Hero.dart' as Marvel;

class HeroesPage extends StatefulWidget {
  HeroesPageView view;
  @override
  State<HeroesPage> createState()  {
    view = HeroesPageView();
    return view;
  }

  void setSearchKey(String key) {
    view.updateStateFromOutSide(key);
  }

}

abstract class HeroesPageState extends State<HeroesPage> {
  HeroesViewModel heroesViewModel;
  String searchKey;

  void updateStateFromOutSide(String searchKey) {
    search(searchKey);

  }

  @override
  void initState() {
    super.initState();
    heroesViewModel = HeroesViewModel(marvelRepository: RemoteMarvelRepository());
    loadData();
  }

  Future loadData() async {
    await heroesViewModel.fetchHeroes(20, 0);
  }

  Future search(String searchKey) async {
    await heroesViewModel.searchHeroes(20, 0, searchKey);
  }

}