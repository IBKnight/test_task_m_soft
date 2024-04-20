import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_m_soft/common/icons.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/point/point_entity.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.point});

  final PointEntity point;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: point.x.toDouble(),
        top: point.y.toDouble(),
        child: SvgPicture.asset(point.status == 'completed'
            ? AppIcons.completeIcon
            : AppIcons.uncompleteIcon));
  }
}
