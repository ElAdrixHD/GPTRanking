import 'package:injectable/injectable.dart';
import 'package:ranking_app/core/app/data/services/api_service.dart';
import 'package:ranking_app/core/gpt/data/models/gpt_input_data_model.dart';
import 'package:ranking_app/core/gpt/data/models/gpt_message_data_model.dart';
import 'package:ranking_app/core/gpt/data/models/gpt_output_data_model.dart';
import 'package:ranking_app/core/gpt/domain/interfaces/i_gpt_repository.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_role.dart';

@Injectable(as: IGPTRepository)
class GPTRepository implements IGPTRepository {
  final ApiService _apiService;

  const GPTRepository(this._apiService);

  @override
  Future<GPTResponseModel> getResponse(GPTResponseModel input) async {
    const rankingContext = GPTResponseModel(
      role: GPTRole.system,
      message:
          "You are an assistant whose only function is to give as a result a ranking of what is being asked of you. The user may not exactly say the word ranking, but you must deduce and intuit that they are referring to a ranking. If you are asked for something other than a ranking you should return the following message in the language the user is writing to you: 'I'm sorry but my only functionality is to provide rankings of the topic you ask for'.",
    );
    final inputDataModel = GPTInputDataModel(
      messages: [
        GPTMessageDataModel.fromModel(rankingContext),
        GPTMessageDataModel.fromModel(input),
      ],
    );

    final response = await _apiService.post(
      'chat/completions',
      data: inputDataModel.toJson(),
    );

    final result = GPTOutputDataModel.fromJson(response);

    return result.choices.first.message.toDomain();
  }
}
