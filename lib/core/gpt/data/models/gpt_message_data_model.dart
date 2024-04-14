import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_role.dart';

part 'gpt_message_data_model.g.dart';

@JsonSerializable()
class GPTMessageDataModel {
  final String role;
  final String content;

  const GPTMessageDataModel({
    required this.role,
    required this.content,
  });

  factory GPTMessageDataModel.fromJson(json) =>
      _$GPTMessageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GPTMessageDataModelToJson(this);

  factory GPTMessageDataModel.fromModel(GPTResponseModel model) {
    return GPTMessageDataModel(
      role: model.role.name,
      content: model.message,
    );
  }

  GPTResponseModel toDomain() {
    return GPTResponseModel(
      message: content,
      role: GPTRole.values.firstWhere((element) => element.name == role),
    );
  }
}
