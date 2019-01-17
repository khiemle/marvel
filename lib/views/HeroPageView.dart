import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marvel/models/MarvelUrl.dart';
import 'package:marvel/pages/HeroPage.dart';
import 'package:marvel/models/Hero.dart' as Marvel;
import 'package:url_launcher/url_launcher.dart';

class HeroPageView extends HeroPageState {
  HeroPageView(Marvel.Hero hero) : super(hero);

  Widget buildListOfficialLinks(List<MarvelUrl> list) {
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            return  Padding(
              padding: const EdgeInsets.only(left : 16.0, right: 16.0),
              child: RichText(
                text: TextSpan(
                    text:list[i].type,
                    style: new TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch("${list[i].url}");
                      }
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
        appBar: AppBar(
          title: Text(hero.name),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Hero(
                    tag: 'image${hero.id}',
                    child: Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: new BoxDecoration(
                            boxShadow: kElevationToShadow[6],
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    hero.thumbnail.getPortraitUrl())))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hero.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left : 16.0, right : 16.0, bottom: 8.0),
                    child: Text("Marvel Official Links",
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                  ),
                ),
                buildListOfficialLinks(hero.urls),
              ],
            )));
  }
}
