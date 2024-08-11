import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoryServices {
  Future<List<ProductModel>> getAllProduct(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList = [];
    for (var product in data) {
      productList.add(ProductModel.fromJson(product));
    }
    return productList;
  }
}
