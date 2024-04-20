// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_m_soft/features/card_list/data/models/point/point_model.dart';


part 'object_model.freezed.dart';
part 'object_model.g.dart';

@freezed
class ObjectModel with _$ObjectModel {
    const factory ObjectModel({
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "remaining_points")
        required int remainingPoints,
        @JsonKey(name: "total_points_count")
        required int totalPointsCount,
        @JsonKey(name: "points")
        required List<PointModel> points,
    }) = _ObjectModel;

    factory ObjectModel.fromJson(Map<String, dynamic> json) => _$ObjectModelFromJson(json);
}

