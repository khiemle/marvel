import 'dart:async';
import 'package:marvel/models/Comic.dart';
import 'package:scoped_model/scoped_model.dart';
import 'IMarvelRepository.dart';
import 'package:meta/meta.dart';


class ComicsViewModel extends Model {
  final IMarvelRepository marvelRepository;
  Future<List<Comic>> _comics;

  Future<List<Comic>> get comics => _comics;

  ComicsViewModel({@required this.marvelRepository});

  set comics(Future<List<Comic>> value) {
    _comics = value;
    notifyListeners();
  }

  Future<bool> fetchComics(int limit, int offset) async {
    _comics = marvelRepository?.getComics(limit, offset);
    return _comics != null;
  }
}

