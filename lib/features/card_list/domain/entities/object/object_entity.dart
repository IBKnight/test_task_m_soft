import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/point/point_entity.dart';

part 'object_entity.freezed.dart';

@freezed
class ObjectEntity with _$ObjectEntity {
    const factory ObjectEntity({
        required String title,
        required int remainingPoints,
        required int totalPointsCount,
        required List<PointEntity> points,
        required double occupiedSpace
    }) = _ObjectEntity;

}

