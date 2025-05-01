abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class SuccessState extends AppState {
  final List articles;

  SuccessState({required this.articles});
}

class ErrorState extends AppState {
  ErrorState({required this.errorMessage});
  final String errorMessage;
}
