class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel? ratingModel;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      this.ratingModel});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: int.parse(jsonData['id']),
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      // ratingModel: RatingModel.fromJson(
      // jsonData['rating']),
    );
  }
}

class RatingModel {
  final String? rate;
  final int? count;

  RatingModel({this.rate, this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
        rate: jsonData['rate'].toString(), count: jsonData['count']);
  }
}
