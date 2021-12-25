class Product {
  late String id, name, description;
  late double price;
  late int inStock;
  late List<dynamic> images, coupon, categoryList;
  late DateTime createdDate;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'].toDouble();
    inStock = json['inStock'];
    images = json['photos'];
    categoryList = json['categoryId'];
    createdDate = DateTime.parse(json['createdAt']);
    coupon = json['coupon'];
  }
}
