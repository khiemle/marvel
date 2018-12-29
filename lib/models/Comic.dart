import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/models/MarvelImage.dart';

part 'Comic.g.dart';
@JsonSerializable()

class Comic {
  int id, digitalId, issueNumber, pageCount;
  String title, variantDescription, description, modified, isbn, upc, diamondCode, ean, issn, format,
      resourceURI;
  MarvelImage thumbnail;
  List<MarvelImage> images;

  Comic(this.id, this.digitalId, this.issueNumber, this.pageCount, this.title,
      this.variantDescription, this.description, this.modified, this.isbn,
      this.upc, this.diamondCode, this.ean, this.issn, this.format,
      this.resourceURI, this.thumbnail, this.images);

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

}