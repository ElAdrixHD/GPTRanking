import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ranking_app/core/gpt/data/models/gpt_choices_output_data_model.dart';

part 'gpt_output_data_model.g.dart';

@JsonSerializable(createToJson: false)
class GPTOutputDataModel {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<GPTChoicesOutputDataModel> choices;

  const GPTOutputDataModel({
    required this.model,
    required this.object,
    required this.created,
    required this.id,
    required this.choices,
  });

  factory GPTOutputDataModel.fromJson(Map<String, dynamic> json) =>
      _$GPTOutputDataModelFromJson(json);
}
