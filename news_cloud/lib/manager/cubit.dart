import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_cloud/manager/state.dart';
import 'package:news_cloud/models/article_model.dart';

import '../network/api_services.dart';

class AppCubit extends Cubit<AppState> {
  ApiServices apiServices = ApiServices();

  AppCubit() : super(InitialState());

  getArticles({required String category}) async {
    emit(LoadingState());
    try {
      var json = await apiServices.get(
        endpoint:
            "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=c8ad00290d8247cebd1c97e819a43b04",
      );
      List articles =
          json["articles"].map((element) {
            return ArticleModel(
              title: element["title"] ?? "",
              description: element["description"] ?? '',
              image: element["urlToImage"] ?? '',
            );
          }).toList();
      // print('ar -> $articles');
      emit(SuccessState(articles: articles));
    } on SocketException {
      return "No internet";
    }

    catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
