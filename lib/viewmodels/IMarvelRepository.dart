import 'package:marvel/models/Comic.dart';
import 'package:marvel/models/Hero.dart';
import 'dart:async';

abstract class IMarvelRepository {
  Future<List<Hero>> getHeroes(int limit, int offset);
  Future<List<Hero>> searchHeroes(int limit, int offset, String key);
  Future<List<Comic>> getComics(int limit, int offset);
}