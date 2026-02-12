import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/auth/domain/repos/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpClinicOwnerUsecase {
  final AuthReposirory repository;

  SignUpClinicOwnerUsecase({required this.repository});

  Future<Either<Failure, void>> call({
    required SignupUserParams params,
  }) {
    return repository.signUpClinicOwner(params: params);
  }
}
