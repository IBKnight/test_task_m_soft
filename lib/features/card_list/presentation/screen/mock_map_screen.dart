import 'package:flutter/material.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/object/object_entity.dart';
import 'package:test_task_m_soft/features/card_list/presentation/widget/dot_widget.dart';

class MockMapScreen extends StatelessWidget {
  const MockMapScreen({super.key, required this.object});

  final ObjectEntity object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          object.title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto-Regular'),
        ),
        centerTitle: false,
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(300),
        constrained: false,
        minScale: 0.5,
        child: Stack(
          children: [
            Image.asset('assets/mock_scheme.png'),
            ...object.points.map((e) => DotWidget(
                  point: e,
                )),
          ],
        ),
      ),
    );
  }
}
