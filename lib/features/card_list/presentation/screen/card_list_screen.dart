import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_m_soft/common/icons.dart';
import 'package:test_task_m_soft/common/palette.dart';
import 'package:test_task_m_soft/common/strings.dart';
import 'package:test_task_m_soft/features/card_list/presentation/widget/card_widget.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  ValueNotifier<bool> _isCollapsed = ValueNotifier(false);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _isCollapsed.value = _scrollController.offset > 60.0;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        selectedItemColor: Palette.blue,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.objectsIcon),
              label: Strings.objects),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.setsIcon), label: Strings.sets),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profileIcon),
              label: Strings.profile),
        ],
      ),
      backgroundColor: Palette.bgBlue,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              collapsedHeight: 60,
              title: ValueListenableBuilder(
                valueListenable: _isCollapsed,
                builder: (context, isCollapsed, child) {
                  return isCollapsed
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppIcons.searchIcon)),
                            const Text(Strings.objects),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppIcons.infoIcon)),
                          ],
                        )
                      : const SizedBox();
                },
              ),
              expandedHeight: 120.0,
              backgroundColor: Palette.bgBlue,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return FlexibleSpaceBar(
                      background: constraints.maxHeight <= 120.0
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        Strings.objects,
                                        style: TextStyle(fontSize: 32),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              AppIcons.infoIcon)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              AppIcons.searchIcon)),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          AppIcons.logoIcon,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide.none),
                                      hintText: Strings.search,
                                      contentPadding:
                                          const EdgeInsets.all(10.0),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : null);
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverList.separated(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return const ObjectCard(
                    title: 'ЖК «Цвета радуги»',
                    filmedTodayCount: 0,
                    currentSize: 121.1,
                    filmedTodayCountTotal: 20,
                    currentSizeTotal: 128,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
