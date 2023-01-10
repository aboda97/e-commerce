class CategoryModel {
  late  bool status;
  late  CategoryData data;

  CategoryModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = CategoryData.fromJson(json['data']);
  }
}

class CategoryData {
  late  int currentPage;
  List<Data> data = [];

  CategoryData.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    json['data'].forEach((element){
      data.add(Data.fromJson(element));
    });
  }
}

class Data {
  late int id ;
  late String name;
  late String image;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
