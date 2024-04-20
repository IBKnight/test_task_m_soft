part of 'card_list_bloc.dart';

@immutable
sealed class CardListState {}

final class CardListLoading extends CardListState {}

final class CardListLoaded extends CardListState {
  final List<ObjectEntity> objectsList;
  final double diskSpace;

  CardListLoaded(this.objectsList, this.diskSpace);
}

final class CardListError extends CardListState {
  final String errorMessage;

  CardListError(this.errorMessage);
}
