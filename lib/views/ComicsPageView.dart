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
        child: Container(
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
      ),
    );
  }

  Widget _buildComicsList(List<Comic> list) {
    Widget _buildRow(Comic comic) {
      double width = MediaQuery.of(context).size.width * 0.8;
      double height = width * 324 / 216;

      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius:
                            20.0, // has the effect of softening the shadow
                        spreadRadius:
                            5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: new NetworkImage(comic.thumbnail.getPortraitUrl()),
                  ),
                )),
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
