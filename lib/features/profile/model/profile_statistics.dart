import 'package:json_annotation/json_annotation.dart';

part 'profile_statistics.g.dart';

@JsonSerializable()
class ProfileStatistics {
  @JsonKey(name: 'lists_count')
  final int listsCount;

  @JsonKey(name: 'movies_count')
  final int moviesCount;

  @JsonKey(name: 'watched_count')
  final int watchedCount;

  ProfileStatistics({required this.listsCount, required this.moviesCount, required this.watchedCount});

  factory ProfileStatistics.fromJson(Map<String, dynamic> json) => _$ProfileStatisticsFromJson(json);  
}