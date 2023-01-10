

import 'package:e_commerce/models/favourite_model.dart';
import 'package:e_commerce/models/login_model.dart';

abstract class ShopHomeStates{}

class ShopHomeInitialState extends ShopHomeStates{}
class ShopHomeChangeBottomNavState extends ShopHomeStates{}
class ShopHomeLoadingState extends ShopHomeStates{}
class ShopHomeSuccessState extends ShopHomeStates{}
class ShopHomeErrorState extends ShopHomeStates{}
class ShopHomeCategorySuccessState extends ShopHomeStates{}
class ShopHomeCategoryErrorState extends ShopHomeStates{}
class ShopHomeChangeFavouritesState extends ShopHomeStates{}
class ShopHomeChangeFavouritesSuccessState extends ShopHomeStates{
  final FavouritesModel favouritesModel;
  ShopHomeChangeFavouritesSuccessState(this.favouritesModel);
}
class ShopHomeChangeFavouritesErrorState extends ShopHomeStates{}

class ShopHomeGetFavouritesLoadingState extends ShopHomeStates{}
class ShopHomeGetFavouritesSuccessState extends ShopHomeStates{}
class ShopHomeGetFavouritesErrorState extends ShopHomeStates{}

class ShopHomeUserDataLoadingState extends ShopHomeStates{}
class ShopHomeUserDataSuccessState extends ShopHomeStates{
  final LoginModel loginModel;

  ShopHomeUserDataSuccessState(this.loginModel);
}
class ShopHomeUserDataErrorState extends ShopHomeStates{}

class ShopHomeUpdateUserDataLoadingState extends ShopHomeStates{}
class ShopHomeUpdateUserDataSuccessState extends ShopHomeStates{
  final LoginModel loginModel;

  ShopHomeUpdateUserDataSuccessState(this.loginModel);
}
class ShopHomeUpdateUserDataErrorState extends ShopHomeStates{}
