import 'package:glowguide/core/errors/models/failure.dart';
import 'package:glowguide/core/params/params.dart';
import 'package:glowguide/features/notifications/domain/entities/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>>
      getCurrentUserNotifications();

  Future<Either<Failure, void>> postNotification({
    required NotificationParams params,
  });
}
