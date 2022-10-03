import 'dart:math';

import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/data/models/city_model.dart';
import 'package:climate_app/domain/entities/city.dart';
import 'package:riverpod/riverpod.dart/';

const _randomCityNames = [
  'Amsterdam',
  'London',
  'Paris',
  'New York',
  'Las Vegas',
  'Texas',
  'Ohio',
  'Riyadh',
  'Dubai',
  'Istanbul',
  'Berlin',
  'Tokyo',
  'Doha',
  'Venice',
  'Sidney'
];

class CityRandomDataSource{
  Future<Either<Failure, CityModel>> getCity() async => Right(
    CityModel(
      City(
        name: _randomCityNames[Random().nextInt(_randomCityNames.length)],
      ),
    ),
  );
}

final cityRandomDataSourceProvider = Provider((ref) => CityRandomDataSource());