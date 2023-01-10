class HomeModel {
  late  bool status;
  late  Data data;

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late  List<Banners> banners;
  late  List<Products> products;
  late  String ad;

  Data.fromJson(Map<String, dynamic> json){
    banners = List.from(json['banners']).map((e)=>Banners.fromJson(e)).toList();
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    ad = json['ad'];
  }
}
/*
Another Class for data
class Data {
  List<Banners> banners = [];
  List<Products> products = [];
  late  String ad;

  Data.fromJson(Map<String, dynamic> json){
    json['banners'].forEach((e){
      banners.add(e);
    });
  Data.fromJson(Map<String, dynamic> json){
    json['products'].forEach((e){
      products.add(e);
    });
  ad = json['ad'];
  }
}
 */

class Banners {
  late  int id;
  late  String image;

  Banners.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  late  int id;
  late  dynamic price;
  late  dynamic oldPrice;
  late  int discount;
  late  String image;
  late  String name;
  late  bool inFavorites;
  late  bool inCart;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}