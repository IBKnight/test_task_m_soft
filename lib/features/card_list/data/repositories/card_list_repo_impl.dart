import 'dart:developer';

import 'package:test_task_m_soft/features/card_list/data/data_sources/remote_data_source.dart';
import 'package:test_task_m_soft/features/card_list/data/mappers/object_mapper.dart';
import 'package:test_task_m_soft/features/card_list/data/models/object/object_model.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/object/object_entity.dart';
import 'package:test_task_m_soft/features/card_list/domain/repositories/card_list_repo.dart';

class CardListRepo implements ICardListRepository {
  RemoteDataSource _remoteDataSource = RemoteDataSource();
  @override
  Future<List<ObjectEntity>> fetchObjects() async {
    try {
      List<Map<String, Object?>> data = await _remoteDataSource.fetchObjects();
      List<ObjectEntity> objectsList = [];

      objectsList = data
          .map((object) => ObjectMapper.toEntity(ObjectModel.fromJson(object)))
          .toList();

      return objectsList;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
