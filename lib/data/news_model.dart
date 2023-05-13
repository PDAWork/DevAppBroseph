import 'package:dev_app_broseph/data/source_model.dart';

class NewsModel {
  final String title;
  final String? description;
  final String? urlImage;
  final DateTime publishedAt;
  final SourceModel sourceModel;
  bool isCheck;

  NewsModel({
    required this.title,
    required this.description,
    required this.urlImage,
    required this.publishedAt,
    required this.sourceModel,
    this.isCheck = false,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        sourceModel: SourceModel.fromJson(json["source"]),
        title: json["title"],
        description: json["description"],
        urlImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  // @JsonSerializable(explicitToJson: true)
  // factory NewsModel({
  //   required String title,
  //   required String? description,
  //   required String? urlToImage,
  //   required DateTime publishedAt,
  //   @JsonKey(name: 'source')
  //       required SourceModel sourceModel,
  //   @JsonKey(includeFromJson: false, includeToJson: false)
  //   @Default(false)
  //       bool isCheck,
  // }) = _NewsModel;

  // factory NewsModel.fromJson(Map<String, Object?> json) =>
  //     _$NewsModelFromJson(json);
}
