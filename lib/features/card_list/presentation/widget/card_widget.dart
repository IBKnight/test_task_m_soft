import 'package:flutter/material.dart';
import 'package:test_task_m_soft/common/palette.dart';
import 'package:test_task_m_soft/common/strings.dart';

class ObjectCard extends StatelessWidget {
  const ObjectCard({
    super.key,
    required this.title,
    required this.filmedTodayCount,
    required this.currentSize,
    required this.filmedTodayCountTotal,
    required this.currentSizeTotal,
  });

  final String title;
  final int filmedTodayCount;
  final int filmedTodayCountTotal;
  final double currentSizeTotal;

  final double currentSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 3,
              color: Palette.shadow1,
            ),
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 3,
              color: Palette.shadow2,
            ),
          ],
        ),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Palette.title,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Strings.filmedToday,
                          style: TextStyle(
                              color: Palette.subtitleColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto'),
                        ),
                        RichText(
                            text: TextSpan(
                          text: '$filmedTodayCount',
                          style: const TextStyle(
                              color: Palette.title,
                              fontSize: 14,
                              fontFamily: 'Roboto'),
                          children: [
                            TextSpan(
                                text:
                                    ' / $filmedTodayCountTotal ${Strings.available}',
                                style: const TextStyle(
                                    color: Palette.subtitleColor,
                                    fontSize: 11,
                                    fontFamily: 'Roboto'))
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Strings.shootingTaken,
                          style: TextStyle(
                              color: Palette.subtitleColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '$currentSize'.replaceAll('.', ','),
                            style: const TextStyle(
                                color: Palette.title,
                                fontSize: 14,
                                fontFamily: 'Roboto'),
                            children: [
                              TextSpan(
                                text:
                                    ' / ${currentSizeTotal.toString().replaceAll('.', ',')} ${Strings.gb} ${Strings.available}',
                                style: const TextStyle(
                                    color: Palette.subtitleColor, fontSize: 11),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
