part of 'card_list_bloc.dart';

@immutable
sealed class CardListEvent {}

class LoadCardList extends CardListEvent {

}

class SearchCardList extends CardListEvent{
  final String query;

  SearchCardList(this.query);
}
