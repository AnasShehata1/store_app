import 'package:store_app/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCateogires() async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/categories', token: null);

    return data;
  }
}
