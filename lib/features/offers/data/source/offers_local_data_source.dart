import 'dart:convert';
import 'package:glowguide/core/databases/cache/cache_helper.dart';
import 'package:glowguide/core/errors/exceptions/cache_exceptions.dart';
import 'package:glowguide/core/errors/models/error_model.dart';
import 'package:glowguide/features/offers/data/models/get_all_offer_model.dart';

class OffersLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedOffers";

  OffersLocalDataSource({required this.cache});

  void cacheOffers(List<GetAllOfferModel> offers) async {
    try {
      final jsonList = offers.map((e) => e.toJson()).toList();

      final jsonString = jsonEncode(jsonList);

      final success = await cache.save(key, jsonString);

      if (!success) {
        throw const CacheWriteException(
          ErrorModel(errorMessage: "Failed to cache posts"),
        );
      }
    } catch (_) {
      throw const CacheWriteException(
        ErrorModel(errorMessage: "Failed to cache posts"),
      );
    }
  }

  Future<List<GetAllOfferModel>> getLastOffers() async {
    try {
      final jsonString = cache.get<String>(key);

      if (jsonString == null) {
        throw const CacheReadException(
          ErrorModel(errorMessage: "No cached posts found"),
        );
      }

      final List decoded = jsonDecode(jsonString);

      return decoded
          .map((e) => GetAllOfferModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      throw const CacheReadException(
        ErrorModel(errorMessage: "Failed to read cached posts"),
      );
    }
  }
}
