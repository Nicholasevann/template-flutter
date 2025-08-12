import 'dart:developer';

import 'package:example/data/models/country/country_model.dart';
import 'package:example/data/repositories/remote/country_repository.dart';
import 'package:example/presentation/auth/register/notifier/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({
    required this.countryRepository,
  }) : super(const RegisterState()) {
    getCountries(); // Fetch countries on initialization
  }

  final CountryRepository countryRepository;

  getCountries() async {
    final res = await countryRepository.fetchCountries();
    res.fold((failure) {
      log(failure.message ?? '');
    }, (result) {
      if (!mounted) return;
      state = state.copyWith(countries: result);
    });
  }

  selectNationality(CountryModel country) {
    state = state.copyWith(selectedCountry: country);
  }
}

final registerProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(countryRepository: CountryRepository()),
);
