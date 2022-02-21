/// id : 3
/// name : "Product #1"
/// price : 250000

class Product {
  Product({
      int? id,
      String? name,
      int? price,}){
    _id = id!;
    _name = name!;
    _price = price!;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
  }
  int? _id;
  String? _name;
  int? _price;

  int get id => _id!;
  String get name => _name!;
  int get price => _price!;

}