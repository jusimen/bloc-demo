part of 'article_bloc.dart';

@immutable
abstract class ArticleState {
  const ArticleState();
}

class ArticleStateInitial extends ArticleState {
  const ArticleStateInitial();
}

class ArticleStateLoading extends ArticleState {
  const ArticleStateLoading();
}

class ArticleStateLoaded extends ArticleState {
  final Article article;
  const ArticleStateLoaded(this.article);
}

class ArticleStateListLoaded extends ArticleState {
  final List<Article> articles;
  const ArticleStateListLoaded(this.articles);
}

class ArticleStateError extends ArticleState {
  final String message;
  const ArticleStateError(this.message);
}
