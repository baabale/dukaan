class Category {
  late String id, name, description, image;
  late DateTime createdDate;

  // factory method / constructor
  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdDate = DateTime.parse(json['createdAt']);
  }
}
