import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/network/responses/ComicsData.dart';

part 'ComicsResponse.g.dart';

@JsonSerializable()
class ComicsResponse {
  ComicsData data;

  factory ComicsResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicsResponseFromJson(json);

  ComicsResponse(this.data);
}
