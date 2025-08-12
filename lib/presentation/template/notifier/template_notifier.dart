import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'template_state.dart';

class TemplateNotifier extends StateNotifier<TemplateState> {
  TemplateNotifier() : super(const TemplateState());
}

final templateProvider =
    StateNotifierProvider.autoDispose<TemplateNotifier, TemplateState>(
  (ref) => TemplateNotifier(),
);
