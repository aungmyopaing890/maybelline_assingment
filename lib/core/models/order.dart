class Order {
  String? id;
  String? name;
  String? phone;
  String? address;
  double price = 0;
  String? priceSign;
  int quantity = 0;
  double total = 0;

  Order({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.price = 0,
    this.priceSign,
    this.quantity = 1,
    this.total = 0,
  });

  Order.initial()
      : id = "0",
        quantity = 1,
        price = 0,
        total = 0;

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    price = double.parse(json['price'].toString());
    priceSign = json['priceSign'];
    quantity = int.parse(json['quantity'].toString());
    total = double.parse(json['total'].toString());
  }
}
