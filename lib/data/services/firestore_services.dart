import 'package:bloc_example/data/models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String articlesCollection = 'articles';

  Stream<List<Article>> getArticles() {
    return _firestore.collection(articlesCollection).snapshots().map((snapshot) => snapshot.docs.map((doc) => Article.fromMap(doc.data())).toList());
  }

  Future<Article> getArticleById(String id) {
    return _firestore.collection(articlesCollection).doc(id).get().then((value) => Article.fromMap(value.data()!));
  }

  Stream<Article> getArticleStreamById(String id) {
    return _firestore.collection(articlesCollection).doc(id).snapshots().map((snapshot) => Article.fromMap(snapshot.data()!));
  }
}
