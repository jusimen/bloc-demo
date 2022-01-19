import 'package:bloc_example/data/models/article.dart';
import 'package:bloc_example/data/services/firestore_services.dart';

class ArticleRepository {
  FirestoreServices firestoreServices = FirestoreServices();

  Stream<List<Article>> getArticles() => firestoreServices.getArticles();

  Future<Article> getArticleById(String id) => firestoreServices.getArticleById(id);

  //Get Single article with Stream instead of future
  Stream<Article> getArticleStreamById(String id) => firestoreServices.getArticleStreamById(id);
}
