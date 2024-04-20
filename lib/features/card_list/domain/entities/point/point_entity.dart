import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_entity.freezed.dart';

@freezed
class PointEntity with _$PointEntity {
    const factory PointEntity({
        required int x,
        required int y,
        required String status,
    }) = _PointEntity;

}
