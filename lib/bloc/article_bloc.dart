import 'package:bloc/bloc.dart';
import 'package:bloc_example/data/models/article.dart';
import 'package:bloc_example/data/repos/article_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _repository;
  ArticleBloc(this._repository) : super(ArticleStateInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is ArticleEventFetch) {
        emit(ArticleStateLoading());
        try {
          final article = await _repository.getArticleById(event.id);
          emit(ArticleStateLoaded(article));
        } catch (e) {
          emit(ArticleStateError(e.toString()));
        }
      } else if (event is ArticleEventFetchList) {
        emit(ArticleStateLoading());
        try {
          //? How to pass Stream<List<Article>> to List<Article>
          // final articles = _repository.getArticles();
          // emit(ArticleStateLoaded(articles));
        } catch (e) {
          emit(ArticleStateError(e.toString()));
        }
      }
    });
  }
}
