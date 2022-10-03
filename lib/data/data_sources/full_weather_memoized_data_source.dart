import 'dart:math';

import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/domain/entities/full_weather.dart';
import 'package:riverpod/riverpod.dart/';

class FullWeatherMemoizedDataSource{
  FullWeather? _fullWeather;

  DateTime? _fetchingTime;

  static const _invalidationDuration = Duration(minutes: 10);

  Future<Either<Failure, FullWeather?>> getMemoizedFullWeather() async{
    if (_fullWeather == null) return const Right(null);

    if(DateTime.now().difference(_fetchingTime!) >= _invalidationDuration){
      _fullWeather = null;
      _fetchingTime = null;
      return const Right(null);
    }

    await Future<void>.delayed(
      Duration(
        milliseconds: 200 + Random().nextInt(800 - 200),
      ),
    );

    return Right(_fullWeather);
  }

  Future<Either<Failure, void>> setFullWeather(FullWeather fullWeather) async{
    _fetchingTime = DateTime.now();
    _fullWeather = fullWeather;
    return const Right(null);
  }
}

final fullWeatherMemoizedDataSourceProvider =
    Provider((ref) => FullWeatherMemoizedDataSource());