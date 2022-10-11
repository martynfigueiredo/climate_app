import 'package:climate_app/core/either.dart';
import 'package:climate_app/core/failure.dart';
import 'package:climate_app/domain/entities/unit_system.dart';
import 'package:riverpod/riverpod.dart';

abstract class UnitSystemRepo {
  Future<Either<Failure, UnitSystem>> getUnitSystem();

  Future<Either<Failure, void>> setUnitSystem(UnitSystem unitSystem);
}

final unitSystemRepoProvider =
    Provider<UnitSystemRepo>((ref) => throw UnimplementedError());
