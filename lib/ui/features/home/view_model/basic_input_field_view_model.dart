import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'basic_input_field_view_model.gform.dart';

@ReactiveFormAnnotation(name: 'BasicInputFieldModel')
class BasicInputFieldViewModel {
  final String input;

  BasicInputFieldModelForm get generateFormModel => BasicInputFieldModelForm(
        BasicInputFieldModelForm.formElements(this),
        null,
      );

  BasicInputFieldViewModel({
    @FormControlAnnotation(validators: [RequiredValidator()]) this.input = '',
  });
}
