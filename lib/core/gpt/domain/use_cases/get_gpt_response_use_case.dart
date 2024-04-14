import 'package:injectable/injectable.dart';
import 'package:ranking_app/core/gpt/domain/interfaces/i_gpt_repository.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_role.dart';

@injectable
class GetGPTResponseUseCase {
  final IGPTRepository _repository;

  const GetGPTResponseUseCase(this._repository);

  Future<GPTResponseModel> call({required String input}) async {
    return _repository.getResponse(
      GPTResponseModel(
        message: input,
        role: GPTRole.user,
      ),
    );
  }
}
