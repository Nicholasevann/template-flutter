import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState {
  const factory TemplateState({
    @Default(false) bool isLoading,
  }) = _TemplateState;
}
