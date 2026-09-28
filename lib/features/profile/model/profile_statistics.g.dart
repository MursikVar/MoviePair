// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileStatistics _$ProfileStatisticsFromJson(Map<String, dynamic> json) =>
    ProfileStatistics(
      listsCount: (json['lists_count'] as num).toInt(),
      moviesCount: (json['movies_count'] as num).toInt(),
      watchedCount: (json['watched_count'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileStatisticsToJson(ProfileStatistics instance) =>
    <String, dynamic>{
      'lists_count': instance.listsCount,
      'movies_count': instance.moviesCount,
      'watched_count': instance.watchedCount,
    };
