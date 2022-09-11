class Cart {
  int? id;
  int? itemId;
  String? itemName;
  double total;
  double itemPrice;
  int quantity;

  Cart({
    this.id,
    this.itemId,
    this.itemName,
    required this.total,
    required this.itemPrice,
    required this.quantity,
  });

  Cart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        itemId = data['itemId'],
        itemName = data['itemName'],
        total = data['total'],
        itemPrice = data['itemPrice'],
        quantity = data['quantity'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'total': total,
      'itemPrice': itemPrice,
      'quantity': quantity,
    };
  }
}
