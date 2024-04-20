import 'package:test_task_m_soft/features/card_list/data/models/point/point_model.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/point/point_entity.dart';

class PointMapper {
  static PointEntity toEntity(PointModel model) {
    return PointEntity(
      x: model.x,
      y: model.y,
      status: model.status,
    );
  }

  static PointModel toModel(PointEntity entity) {
    return PointModel(
      x: entity.x,
      y: entity.y,
      status: entity.status,
    );
  }
}
