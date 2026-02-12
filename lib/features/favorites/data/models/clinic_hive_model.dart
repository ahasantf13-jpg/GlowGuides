import 'dart:convert';

class ClinicHiveModel {
  final String clinicId;
  final String clinicName;
  final String clinicLogoUrl;
  final String clinicDescription;
  final String clinicLocation;
  final double clinicAverageRating;
  final int clinicRatingCount;

  ClinicHiveModel({
    required this.clinicId,
    required this.clinicName,
    required this.clinicLogoUrl,
    required this.clinicDescription,
    required this.clinicLocation,
    required this.clinicAverageRating,
    required this.clinicRatingCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'clinicId': clinicId,
      'clinicName': clinicName,
      'clinicLogoUrl': clinicLogoUrl,
      'clinicDescription': clinicDescription,
      'clinicLocation': clinicLocation,
      'clinicAverageRating': clinicAverageRating,
      'clinicRatingCount': clinicRatingCount,
    };
  }

  factory ClinicHiveModel.fromMap(Map<String, dynamic> map) {
    return ClinicHiveModel(
      clinicId: map['clinicId'] ?? '',
      clinicName: map['clinicName'] ?? '',
      clinicLogoUrl: map['clinicLogoUrl'] ?? '',
      clinicDescription: map['clinicDescription'] ?? '',
      clinicLocation: map['clinicLocation'] ?? '',
      clinicAverageRating: (map['clinicAverageRating'] is int)
          ? (map['clinicAverageRating'] as int).toDouble()
          : (map['clinicAverageRating'] as num?)?.toDouble() ?? 0.0,
      clinicRatingCount: map['clinicRatingCount'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClinicHiveModel.fromJson(String source) =>
      ClinicHiveModel.fromMap(json.decode(source));
}
