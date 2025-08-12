import 'package:example/data/models/country/country_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default([]) List<CountryModel> countries,
    CountryModel? selectedCountry,
  }) = _RegisterState;
}
