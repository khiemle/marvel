import 'package:marvel/models/Hero.dart';
import 'dart:async';

abstract class IMarvelRepository {
  Future<List<Hero>> getHeroes(int limit, int offset);
}