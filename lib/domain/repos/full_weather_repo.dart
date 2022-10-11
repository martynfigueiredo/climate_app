import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/domain/entities/city.dart';
import 'package:climate_app/domain/entities/full_weather.dart';
import 'package:riverpod/riverpod.dart';

abstract class FullWeatherRepo {
  Future<Either<Failure, FullWeather>> getFullWeather(City city);
}

final fullWeatherRepoProvider =
    Provider<FullWeatherRepo>((ref) => throw UnimplementedError());
