import 'package:marvel/models/Comic.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ComicsData.g.dart';

@JsonSerializable()
class ComicsData {
  List<Comic> results;

  factory ComicsData.fromJson(Map<String, dynamic> json) => _$ComicsDataFromJson(json);

  ComicsData(this.results);
}
