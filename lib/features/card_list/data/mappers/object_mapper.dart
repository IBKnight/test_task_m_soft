import 'package:test_task_m_soft/features/card_list/data/mappers/point_mapper.dart';
import 'package:test_task_m_soft/features/card_list/data/models/object/object_model.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/object/object_entity.dart';

class ObjectMapper {
  static ObjectEntity toEntity(ObjectModel model) {
    final occupiedSpace = model.totalPointsCount * 5.0;
    return ObjectEntity(
      title: model.title,
      remainingPoints: model.remainingPoints,
      totalPointsCount: model.totalPointsCount,
      points: model.points.map((point) => PointMapper.toEntity(point)).toList(),
      occupiedSpace: occupiedSpace,
    );
  }

  static ObjectModel toModel(ObjectEntity entity) {
    return ObjectModel(
      title: entity.title,
      remainingPoints: entity.remainingPoints,
      totalPointsCount: entity.totalPointsCount,
      points: entity.points.map((point) => PointMapper.toModel(point)).toList(),
    );
  }
}
