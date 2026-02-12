import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/offers/domain/entities/get_all_offers_entities.dart';
import 'package:dartz/dartz.dart';

abstract class OfferRepository {
  Future<Either<Failure, void>> createNewOffer({
    required CreateOffersParams params,
  });

  Future<Either<Failure, List<GetAllOffersEntities>>> getAllOffers();

  Future<Either<Failure, void>> adminApproveRejectOffers(
      {required AdminApproveRejectOffersParams params});
}
