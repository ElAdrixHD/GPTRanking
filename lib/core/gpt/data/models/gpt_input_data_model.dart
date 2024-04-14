import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ranking_app/core/gpt/data/models/gpt_message_data_model.dart';

part 'gpt_input_data_model.g.dart';

@JsonSerializable(createFactory: false)
class GPTInputDataModel {
  final String model;
  final double temperature;
  final List<GPTMessageDataModel> messages;

  const GPTInputDataModel({
    this.model = 'gpt-3.5-turbo',
    this.temperature = 0.7,
    required this.messages,
  });

  Map<String, dynamic> toJson() => _$GPTInputDataModelToJson(this);
}
