import 'package:flutter/material.dart';
import 'package:marvel/data/RemoteMarvelRepository.dart';
import 'package:marvel/viewmodels/ComicsViewModel.dart';
import 'package:marvel/views/ComicsPageView.dart';


class ComicsPage extends StatefulWidget {
  @override
  State<ComicsPage> createState() => ComicsPageView();

}

abstract class ComicsPageState extends State<ComicsPage> {
  ComicsViewModel comicsViewModel;

  @override
  void initState() {
    super.initState();
    comicsViewModel = ComicsViewModel(marvelRepository: RemoteMarvelRepository());
    loadData();
  }

  Future loadData() async {
    await comicsViewModel.fetchComics(20, 0);
  }

}