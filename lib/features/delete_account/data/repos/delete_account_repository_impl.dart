import 'package:dartz/dartz.dart';
import 'package:glowguide/core/connections/network_info.dart';
import 'package:glowguide/core/errors/exceptions/app_exceptions.dart';
import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/delete_account/data/source/delete_account_remote_data_source.dart';
import 'package:glowguide/features/delete_account/domain/repos/delete_account_repository.dart';

class DeleteAccountRepositoryImpl extends DeleteAccountRepository {
  final NetworkInfo networkInfo;
  final DeleteAccountRemoteDataSource remoteDataSource;

  DeleteAccountRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> deleteAccount(
      {required DeleteAccountParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteAccount(params);

        return const Right(null);
      } on AppException catch (e) {
        return Left(Failure(errMessage: e.error.errorMessage));
      } catch (_) {
        return Left(Failure(errMessage: "Something went wrong!"));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection!"));
    }
  }
}
