import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';

abstract class IGPTRepository {
  Future<GPTResponseModel> getResponse(GPTResponseModel input);
}
