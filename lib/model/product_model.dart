class ProductModel {
  // String? brand;
  // String? category;
  // String? colors;
  // String? createdAt;
  List<String>? _images;
  String? _name;
  // String? newPrice;
  // String? oldPrice;
  // Map<String, int>? ratings;
  // int? quantity;
  // String? description;

  ProductModel(
    // this.brand,
    // this.category,
    // this.colors,
    // this.createdAt,
    this._images,
    this._name,
    // this.newPrice,
    // this.oldPrice,
    // this.ratings,
    // this.quantity,
    // this.description
  );
  String? get name => _name;
  List<String>? get images => _images;

  ProductModel.fromJson(dynamic json) {
    // quantity = json['quantity'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    // category = json['category'];
    // colors = json['colors'] != null ? json['colors'].cast<String>() : [];
    // description =
    //     json['description'] != null ? json['description'].cast<String>() : [];
    _name = json['name'] != null ? json['name'].cast<String>() : '';
  }
}
