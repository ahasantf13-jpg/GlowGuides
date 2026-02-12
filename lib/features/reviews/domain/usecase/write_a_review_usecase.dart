import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/reviews/domain/repos/reviews_repository.dart';
import 'package:dartz/dartz.dart';

class WriteAReviewUsecase {
  final ReviewsRepository repository;

  WriteAReviewUsecase({required this.repository});

  Future<Either<Failure, void>> call({
    required WriteReviewParams params,
  }) {
    return repository.writeReiew(params: params);
  }
}
