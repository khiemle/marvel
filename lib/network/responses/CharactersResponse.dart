import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/network/responses/Data.dart';

part 'CharactersResponse.g.dart';

@JsonSerializable()
class CharactersResponse {
  Data data;

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  CharactersResponse(this.data);
}
