import 'package:bloc_example/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ArticleBloc>().add(ArticleEventFetch('7vKfRUxpNGFILy6hKY5d'));
    context.read<ArticleBloc>().add(ArticleEventFetchList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Demo'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bloc with Future", style: TextStyle(fontSize: 16)),
            BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
                if (state is ArticleStateLoading) {
                  return CircularProgressIndicator();
                } else if (state is ArticleStateError) {
                  return Text(state.message);
                } else if (state is ArticleStateLoaded) {
                  return ListTile(
                    leading: Image.network(state.article.imageUrl),
                    title: Text(state.article.title),
                    subtitle: Text(state.article.description),
                  );
                } else {
                  return Text("Data not loaded");
                }
              },
            ),
            Text("Bloc with Stream", style: TextStyle(fontSize: 16)),
            BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
                if (state is ArticleStateLoading) {
                  return CircularProgressIndicator();
                } else if (state is ArticleStateError) {
                  return Text(state.message);
                } else if (state is ArticleStateListLoaded) {
                  return ListView.builder(
                    itemCount: state.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(state.articles[index].imageUrl),
                        title: Text(state.articles[index].title),
                        subtitle: Text(state.articles[index].description),
                      );
                    },
                  );
                } else {
                  return Text("Data not loaded");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
