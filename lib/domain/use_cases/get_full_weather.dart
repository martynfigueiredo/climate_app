import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/core/use_case.dart';
import 'package:climate_app/domain/entities/city.dart';
import 'package:climate_app/domain/entities/full_weather.dart';
import 'package:climate_app/domain/repos/full_weather_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';

class GetFullWeather implements UseCase<FullWeather, GetFullWeatherParams> {
  const GetFullWeather(this.repo);

  final FullWeatherRepo repo;

  @override
  Future<Either<Failure, FullWeather>> call(GetFullWeatherParams params) =>
      repo.getFullWeather(params.city);
}

class GetFullWeatherParams extends Equatable {
  const GetFullWeatherParams({required this.city});

  final City city;

  @override
  List<Object?> get props => [city];
}

final getFullWeatherProvider =
    Provider((ref) => GetFullWeather(ref.watch(fullWeatherRepoProvider)));
