

abstract class HomeLayoutStates{}

class HomeLayoutInitialState extends HomeLayoutStates{}


class HomeLayoutChangeIndexState extends HomeLayoutStates{}

class HomeLayoutLoadingState extends HomeLayoutStates{}
class HomeLayoutSuccessfulState extends HomeLayoutStates{}
class HomeLayoutErrorState extends HomeLayoutStates{
  final String error;

  HomeLayoutErrorState(this.error);

}

class CategoriesLayoutLoadingState extends HomeLayoutStates{}
class CategoriesLayoutSuccessfulState extends HomeLayoutStates{}
class CategoriesLayoutErrorState extends HomeLayoutStates{
  final String error;

  CategoriesLayoutErrorState(this.error);

}

class FavoriteLayoutSuccessfulState extends HomeLayoutStates{}
class FavoriteLayoutErrorState extends HomeLayoutStates{
  final String error;

  FavoriteLayoutErrorState(this.error);

}

class UserDataLayoutSuccessfulState extends HomeLayoutStates{}
class UserDataLayoutErrorState extends HomeLayoutStates{
  final String error;

  UserDataLayoutErrorState(this.error);

}
