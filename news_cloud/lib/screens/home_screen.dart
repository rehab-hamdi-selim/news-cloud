import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_cloud/manager/cubit.dart';
import 'package:news_cloud/models/article_model.dart';
import 'package:news_cloud/network/api_services.dart';
import 'package:news_cloud/widgets/article_list.dart';
import 'package:news_cloud/widgets/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();
  List<ArticleModel> articles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App'), centerTitle: true),
      body: ListView(
        children: [
          CarouselSliderWidget(
            onCategorySelected: (String category) {
              BlocProvider.of<AppCubit>(
                context,
              ).getArticles(category: category);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [ArticleList()],
            ),
          ),
        ],
      ),
    );
  }
}
