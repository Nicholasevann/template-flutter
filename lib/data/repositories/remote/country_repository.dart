import 'package:example/data/models/country/country_model.dart';
import 'package:example/shared/index.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CountryRepository {
  Future<Either<Failure, List<CountryModel>>> fetchCountries() async {
    try {
      final response = await Dio().get(
        'https://restcountries.com/v3.1/all?fields=name,flags,cca2',
      );

      List<CountryModel> countries = (response.data as List)
          .map((data) => CountryModel.fromJson(data))
          .toList();

      countries.sort(
          (a, b) => (a.name?.common ?? '').compareTo(b.name?.common ?? ''));

      return Right(countries);
    } catch (e) {
      if (e is DioException) {
        return Left(Failure(
          code: e.response?.statusCode,
          message: 'Something went wrong',
          error: e,
        ));
      }
      return Left(Failure(message: e.toString(), error: e));
    }
  }
}
