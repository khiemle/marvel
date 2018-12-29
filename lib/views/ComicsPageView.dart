import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:marvel/models/Comic.dart';
import 'package:marvel/pages/ComicsPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ComingSoonView.dart';
class ComicsPageView extends ComicsPageState {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel(
        model: comicsViewModel,
        child: Center(
          child: FutureBuilder<List<Comic>>(
            future: comicsViewModel.comics,
            builder: (context, snapshot) {
              if (snapshot != null) {
                if (snapshot.hasData) {
                  return _buildComicsList(snapshot.data);
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
      ),
    );
  }

  Widget _buildComicsList(List<Comic> list) {
    Widget _buildRow(Comic comic) {
      double left_width = MediaQuery.of(context).size.width * 0.8;

      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: Container(
                  width: left_width,
                  height: left_width,
                  child:new Image(
                          fit: BoxFit.fill,
                          image: new NetworkImage(comic.thumbnail.getPortraitUrl()),
            ))),
            Text(
              comic.title,
              textAlign: TextAlign.left,
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
