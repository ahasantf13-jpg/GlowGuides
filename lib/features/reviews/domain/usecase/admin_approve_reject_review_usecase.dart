import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/reviews/domain/repos/reviews_repository.dart';
import 'package:dartz/dartz.dart';

class AdminApproveRejectReviewUsecase {
  final ReviewsRepository repository;

  AdminApproveRejectReviewUsecase({required this.repository});

  Future<Either<Failure, void>> call({
    required AdminApproveRejectReviewParams params,
  }) {
    return repository.adimnApproveRejecrReview(params: params);
  }
}
