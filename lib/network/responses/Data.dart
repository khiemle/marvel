import 'package:marvel/models/Hero.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Data.g.dart';

@JsonSerializable()
class Data {
  List<Hero> results;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data(this.results);
}
