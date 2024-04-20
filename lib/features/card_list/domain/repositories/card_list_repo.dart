import 'package:test_task_m_soft/features/card_list/domain/entities/object/object_entity.dart';

abstract interface class ICardListRepository{
  Future<List<ObjectEntity>> fetchObjects();
}