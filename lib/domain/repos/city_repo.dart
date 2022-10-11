import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/domain/entities/city.dart';
import 'package:riverpod/riverpod.dart';

abstract class CityRepo {
  Future<Either<Failure, City>> getCity();

  Future<Either<Failure, void>> setCity(City city);
}

final cityRepoProvider =
    Provider<CityRepo>((ref) => throw UnimplementedError());
