import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/clinic_hive_model.dart';

class FavoritesService {
  static const String _key = 'favoriteClinics';

  FavoritesService._internal() {
    _init();
  }

  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() => _instance;

  final ValueNotifier<List<ClinicHiveModel>> favoritesNotifier =
      ValueNotifier<List<ClinicHiveModel>>([]);

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    final list = raw.map((e) => ClinicHiveModel.fromJson(e)).toList();
    favoritesNotifier.value = list;
  }

  Future<void> addFavorite(ClinicHiveModel clinic) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_key) ?? [];
    final map = current.map((e) => ClinicHiveModel.fromJson(e)).toList();

    // replace if exists, else add
    final idx = map.indexWhere((c) => c.clinicId == clinic.clinicId);
    if (idx >= 0) {
      map[idx] = clinic;
    } else {
      map.add(clinic);
    }

    final encoded = map.map((e) => e.toJson()).toList();
    await prefs.setStringList(_key, encoded);
    favoritesNotifier.value = List.from(map);
  }

  Future<void> removeFavorite(String clinicId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_key) ?? [];
    final map = current.map((e) => ClinicHiveModel.fromJson(e)).toList();
    map.removeWhere((c) => c.clinicId == clinicId);
    final encoded = map.map((e) => e.toJson()).toList();
    await prefs.setStringList(_key, encoded);
    favoritesNotifier.value = List.from(map);
  }

  bool isFavorite(String clinicId) {
    return favoritesNotifier.value.any((c) => c.clinicId == clinicId);
  }

  List<ClinicHiveModel> getFavorites() {
    return List.from(favoritesNotifier.value);
  }
}
