import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/clinics/domain/entities/clinic_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ClinicRepository {
  Future<Either<Failure, List<ClinicEntity>>> getAllClinics();

  Future<Either<Failure, void>> createNewClinic({
    required CreateNewClinicParams params,
  });

  Future<Either<Failure, void>> admingApproveRejectClinic(
      {required AdminApproveRejectClinicParams params});
}
