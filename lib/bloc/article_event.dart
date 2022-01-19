part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class ArticleEventFetch extends ArticleEvent {
  final String id;
  const ArticleEventFetch(this.id);

  @override
  List<Object> get props => [id];
}

class ArticleEventFetchList extends ArticleEvent {
  const ArticleEventFetchList();

  @override
  List<Object> get props => [];
}
