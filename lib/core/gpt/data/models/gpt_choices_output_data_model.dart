import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ranking_app/core/gpt/data/models/gpt_message_data_model.dart';

part 'gpt_choices_output_data_model.g.dart';

@JsonSerializable(createToJson: false)
class GPTChoicesOutputDataModel {
  final int index;
  final GPTMessageDataModel message;

  const GPTChoicesOutputDataModel({
    required this.message,
    required this.index,
  });

  factory GPTChoicesOutputDataModel.fromJson(Map<String, dynamic> json) =>
      _$GPTChoicesOutputDataModelFromJson(json);
}
