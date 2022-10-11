import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/core/use_case.dart';
import 'package:climate_app/domain/entities/city.dart';
import 'package:climate_app/domain/repos/city_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';

class SetCity implements UseCase<void, SetCityParams> {
  const SetCity(this.repo);

  final CityRepo repo;

  @override
  Future<Either<Failure, void>> call(SetCityParams params) =>
      repo.setCity(params.city);
}

class SetCityParams extends Equatable {
  const SetCityParams(this.city);

  final City city;

  @override
  List<Object?> get props => [city];
}

final setCityProvider = Provider((ref) => SetCity(ref.watch(cityRepoProvider)));
