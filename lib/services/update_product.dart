import 'dart:developer';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct {
  Future<dynamic> updateProduct(
      {required String title,
      required int id,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    log(id.toString());
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
