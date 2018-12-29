import 'package:flutter/material.dart';
import 'package:marvel/pages/HeroesPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:marvel/models/Hero.dart' as Marvel;

class HeroesPageView extends HeroesPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel(
        model: heroesViewModel,
        child: FutureBuilder<List<Marvel.Hero>>(
          future: heroesViewModel.heroes,
          builder: (context, snapshot) {
            if (snapshot != null) {
              if (snapshot.hasData) {
                return _buildHeroesList(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeroesList(List<Marvel.Hero> list) {
    Widget _buildRow(Marvel.Hero hero) {
      double left_width = MediaQuery.of(context).size.width * 0.25;
      return Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: Container(
                  width: left_width,
                  height: left_width,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(hero.thumbnail.getUrl())))),
            ),
            Text(
              hero.name,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return _buildRow(list[i]);
        });
  }
}
