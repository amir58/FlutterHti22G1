import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/news/cubits/news_cubit.dart';
import 'package:hti22one/news/models/news_response.dart';

// BlocWidgets
// BlocBuilder => rebuild design
// BlocListener => listen states
// BlocConsumer => BlocBuilder + BlocListener

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsCubit newsCubit;

  @override
  void initState() {
    super.initState();
    newsCubit = context.read<NewsCubit>();
    newsCubit.getNews(category: "sports");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is GetNewsFailureState) {
          print('NEWS ERROR => ${state.errorMessage}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
          ),
          body: newsCubit.articles.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: newsCubit.articles.length,
                    itemBuilder: (context, index) {
                      Articles article = newsCubit.articles[index];

                      print("ImageURL $index => ${article.urlToImage}");

                      return buildArticleDesign(article);
                    },
                  ),
                ),
        );
      },
    );
  }

  Widget buildArticleDesign(Articles article) {
    const double articleCardRadius = 15;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(articleCardRadius),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(articleCardRadius),
              topRight: Radius.circular(articleCardRadius),
            ),
            child: Image.network(
              article.urlToImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset("images/image.jpg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Title : ${article.title}"),
          ),
        ],
      ),
    );
  }
}
