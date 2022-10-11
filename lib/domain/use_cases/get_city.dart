import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/core/use_case.dart';
import 'package:climate_app/domain/entities/city.dart';
import 'package:climate_app/domain/repos/city_repo.dart';
import 'package:riverpod/riverpod.dart';

class GetCity implements UseCase<City, NoParams> {
  const GetCity(this.repo);

  final CityRepo repo;

  @override
  Future<Either<Failure, City>> call(NoParams params) => repo.getCity();
}

final getCityProvider = Provider((ref) => GetCity(ref.watch(cityRepoProvider)));
