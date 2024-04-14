import 'package:ranking_app/core/gpt/domain/models/gpt_role.dart';

class GPTResponseModel {
  final GPTRole role;
  final String message;

  const GPTResponseModel({
    required this.message,
    required this.role,
  });
}
