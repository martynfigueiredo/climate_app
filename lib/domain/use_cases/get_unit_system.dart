import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/core/use_case.dart';
import 'package:climate_app/domain/entities/unit_system.dart';
import 'package:climate_app/domain/repos/unit_system_repo.dart';
import 'package:riverpod/riverpod.dart';

class GetUnitSystem implements UseCase<UnitSystem, NoParams> {
  const GetUnitSystem(this.repo);

  final UnitSystemRepo repo;

  @override
  Future<Either<Failure, UnitSystem>> call(NoParams params) =>
      repo.getUnitSystem();
}

final getUnitSystemProvider =
    Provider((ref) => GetUnitSystem(ref.watch(unitSystemRepoProvider)));
