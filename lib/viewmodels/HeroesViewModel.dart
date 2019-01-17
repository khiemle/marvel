import 'dart:async';
import 'package:marvel/models/Hero.dart';
import 'package:scoped_model/scoped_model.dart';
import 'IMarvelRepository.dart';
import 'package:meta/meta.dart';


class HeroesViewModel extends Model {
  final IMarvelRepository marvelRepository;
  Future<List<Hero>> _heroes;

  Future<List<Hero>> get heroes => _heroes;

  HeroesViewModel({@required this.marvelRepository});

  set heroes(Future<List<Hero>> value) {
    _heroes = value;
    notifyListeners();
  }

  Future<bool> fetchHeroes(int limit, int offset) async {
    _heroes = marvelRepository?.getHeroes(limit, offset);
    return _heroes != null;
  }

  Future<bool> searchHeroes(int limit, int offset, String searchKey) async{
    _heroes = marvelRepository?.searchHeroes(limit, offset, searchKey);
    return _heroes != null;
  }
}

