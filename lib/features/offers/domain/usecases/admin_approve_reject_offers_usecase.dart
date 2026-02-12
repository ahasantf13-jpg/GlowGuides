import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/offers/domain/repository/offer_repository.dart';
import 'package:dartz/dartz.dart';

class AdminApproveRejectOffersUsecase {
  final OfferRepository repository;

  AdminApproveRejectOffersUsecase({required this.repository});

  Future<Either<Failure, void>> call({
    required AdminApproveRejectOffersParams params,
  }) {
    return repository.adminApproveRejectOffers(params: params);
  }
}
