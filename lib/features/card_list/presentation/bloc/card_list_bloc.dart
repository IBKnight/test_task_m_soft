import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_m_soft/common/strings.dart';
import 'package:test_task_m_soft/common/utils/disk_space_handler.dart';
import 'package:test_task_m_soft/features/card_list/domain/entities/object/object_entity.dart';
import 'package:test_task_m_soft/features/card_list/domain/repositories/card_list_repo.dart';

part 'card_list_event.dart';
part 'card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  final ICardListRepository repository;
  CardListBloc(this.repository) : super(CardListLoading()) {
    on<LoadCardList>(_loadCardList);
    on<SearchCardList>(_searchCardList);
  }

  _loadCardList(LoadCardList event, Emitter<CardListState> emit) async {
    try {
      emit(CardListLoading());

      final List<ObjectEntity> list = await repository.fetchObjects();
      double diskSpace = await DiskSpaceHandler.getDiskSpace();
      emit(CardListLoaded(list, diskSpace));
    } catch (e) {
      emit(CardListError(e.toString()));
      rethrow;
    }
  }

  _searchCardList(SearchCardList event, Emitter<CardListState> emit) async {
    try {
      emit(CardListLoading());

      final List<ObjectEntity> list = (await repository.fetchObjects())
          .where((element) => element.title.contains(event.query))
          .toList();

      if (list.isEmpty) {
        emit(CardListError(Strings.emptyList));
        return;
      }

      double diskSpace = await DiskSpaceHandler.getDiskSpace();
      emit(CardListLoaded(list, diskSpace));
    } catch (e) {
      emit(CardListError(e.toString()));
      rethrow;
    }
  }
}
