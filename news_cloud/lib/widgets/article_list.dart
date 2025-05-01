import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_cloud/manager/cubit.dart';
import 'package:news_cloud/manager/state.dart';
import 'package:news_cloud/widgets/article_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return SliverList.separated(
            itemBuilder:
                (c, index) => Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  child: ArticleItem(article: state.articles[index]),
                ),
            itemCount: state.articles.length,
            separatorBuilder:
                (BuildContext context, int index) =>
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          );
        } else if (state is ErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${state.errorMessage}')),
          );
        }
        return SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

/*
* articles.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverList.separated(
                itemBuilder:
                    (c, index) => Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      child: ArticleItem(article: articles[index]),
                    ),
                itemCount: articles.length,
                separatorBuilder:
                    (BuildContext context, int index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
              ),
            ],
          ),
        );
* */
