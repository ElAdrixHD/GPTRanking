import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_role.dart';
import 'package:ranking_app/core/gpt/domain/use_cases/get_gpt_response_use_case.dart';
import 'package:ranking_app/ui/features/home/view_model/response_view_model.dart';

class GPTNotifier extends StateNotifier<ResponseViewModel> {
  GPTNotifier() : super(const ResponseViewModel());

  Future getResponse(String input) async {
    final useCase = GetIt.I<GetGPTResponseUseCase>();
    state = state.copyWith(
      response: [
        ...state.response,
        GPTResponseModel(message: input, role: GPTRole.user),
      ],
    );
    state = state.copyWith(loading: true);
    final response = await useCase(input: input);
    state = state.copyWith(
      loading: false,
      response: [
        ...state.response,
        response,
      ],
    );
  }

  void restart() {
    state = state.copyWith(
      loading: false,
      error: null,
      response: [],
    );
  }
}

final gptProvider =
    StateNotifierProvider.autoDispose<GPTNotifier, ResponseViewModel>(
  (ref) => GPTNotifier(),
);
