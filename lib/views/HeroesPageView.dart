import 'package:flutter/material.dart';
import 'package:marvel/pages/HeroPage.dart';
import 'package:marvel/pages/HeroesPage.dart';
import 'package:marvel/utils/MarvelUtils.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:marvel/models/Hero.dart' as Marvel;
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

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
                return Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: FlareActor(
                      "assets/gear.flr",
                      animation: "rotating",
                    ),
                  ),
                );
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
      double leftWidth = MediaQuery.of(context).size.width * 0.25;
      double rightWidth = MediaQuery.of(context).size.width * 0.6;
      return GestureDetector(
        onTap: () => openHeroPage(hero),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: Container(
                  width: leftWidth,
                  height: leftWidth,
                  decoration: new BoxDecoration(
                      boxShadow: kElevationToShadow[6],
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(hero.thumbnail.getUrl())))),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: rightWidth,
                  child: RichText(
                    text: TextSpan(
                        text:hero.name,
                        style: new TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch("${hero.resourceURI}${MarvelUtils.generateKeys()}");
                          }
                    ),
                  ),
                ),
                Container(
                  width: rightWidth,
                  child: Text(
                    hero.description,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

      return ListView.separated(
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.black87,
            ),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return _buildRow(list[i]);
        });
  }

  openHeroPage(Marvel.Hero hero) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => HeroPage(hero)));
  }
}
