import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ranking_app/ui/features/home/view_model/basic_input_field_view_model.dart';

class InputNotifier extends AutoDisposeNotifier<BasicInputFieldModelForm> {
  @override
  BasicInputFieldModelForm build() =>
      BasicInputFieldViewModel().generateFormModel;

  void clear() {
    state.form.markAllAsTouched();
    if (state.form.valid) {
      state.form.reset();
    }
  }
}

final inputProvider =
    AutoDisposeNotifierProvider<InputNotifier, BasicInputFieldModelForm>(
  InputNotifier.new,
);
