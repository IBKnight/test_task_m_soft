import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task_m_soft/common/icons.dart';
import 'package:test_task_m_soft/common/palette.dart';
import 'package:test_task_m_soft/common/strings.dart';
import 'package:test_task_m_soft/features/card_list/data/repositories/card_list_repo_impl.dart';
import 'package:test_task_m_soft/features/card_list/presentation/bloc/card_list_bloc.dart';
import 'package:test_task_m_soft/features/card_list/presentation/widget/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardListBloc(CardListRepo())..add(LoadCardList()),
      child: const CardListView(),
    );
  }
}

class CardListView extends StatefulWidget {
  const CardListView({super.key});

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  ValueNotifier<bool> _isCollapsed = ValueNotifier(false);
  late ScrollController _scrollController;
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;

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
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.objectsIcon,
                colorFilter: const ColorFilter.mode(
                    Palette.menuInactive, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.objectsIcon,
                colorFilter:
                    const ColorFilter.mode(Palette.blue, BlendMode.srcIn),
              ),
              label: Strings.objects),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.setsIcon),
              activeIcon: SvgPicture.asset(
                AppIcons.setsIcon,
                colorFilter:
                    const ColorFilter.mode(Palette.blue, BlendMode.srcIn),
              ),
              label: Strings.sets),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profileIcon),
              activeIcon: SvgPicture.asset(
                AppIcons.profileIcon,
                colorFilter:
                    const ColorFilter.mode(Palette.blue, BlendMode.srcIn),
              ),
              label: Strings.profile),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
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
                              icon: SvgPicture.asset(AppIcons.searchIcon),
                            ),
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
                                    controller: _textEditingController,
                                    onEditingComplete: () {
                                      context.read<CardListBloc>().add(
                                          SearchCardList(
                                              _textEditingController.text));
                                    },
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
            BlocBuilder<CardListBloc, CardListState>(
              builder: (context, state) {
                return switch (state) {
                  CardListLoading _ => const SliverToBoxAdapter(
                      child: Center(child: CupertinoActivityIndicator())),
                  CardListLoaded _ => SliverList.separated(
                      itemCount: state.objectsList.length,
                      itemBuilder: (context, index) {
                        final object = state.objectsList[index];
                        return ObjectCard(
                          title: object.title,
                          filmedTodayCount: object.remainingPoints,
                          currentSize: object.occupiedSpace,
                          filmedTodayCountTotal: object.totalPointsCount,
                          currentSizeTotal: state.diskSpace,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      }),
                  CardListError _ => SliverToBoxAdapter(
                      child: Center(
                        child: Text(state.errorMessage),
                      ),
                    )
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
