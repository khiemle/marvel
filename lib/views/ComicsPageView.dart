import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:marvel/models/Comic.dart';
import 'package:marvel/pages/ComicsPage.dart';
import 'package:scoped_model/scoped_model.dart';

class ComicsPageView extends ComicsPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel(
        model: comicsViewModel,
        child: FutureBuilder<List<Comic>>(
          future: comicsViewModel.comics,
          builder: (context, snapshot) {
            if (snapshot != null) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ComicTitle(),
                    Expanded(child: _buildComicsList(snapshot.data)),
                  ],
                );
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

  Widget _buildComicsList(List<Comic> list) {
    Widget _buildRow(Comic comic) {
      double width = MediaQuery.of(context).size.width * 0.95;
      double height = width * 324 / 216;

      return Container(
        child: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[6],
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: new NetworkImage(comic.thumbnail.getPortraitUrl()),
                  ),
                )),
            Container(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),
                    child: Text(
                      comic.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return _buildRow(list[i]);
        });
  }
}

class ComicTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Text(
        "This Month Comics",
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'),
      ),
    );
  }
}
