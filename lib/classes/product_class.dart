class Product {
  String? name;
  String? image;
  int? price;
  String? description;
  String? publicationdate;
  Product(
      {required this.image,
      required this.name,
      required this.price,
      required this.description,
      this.publicationdate});
}
