import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';

part 'response_view_model.freezed.dart';

@freezed
class ResponseViewModel with _$ResponseViewModel {
  const factory ResponseViewModel({
    @Default([]) List<GPTResponseModel> response,
    @Default(false) bool loading,
    String? error,
  }) = _ResponseViewModel;
}
