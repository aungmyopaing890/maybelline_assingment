import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maybelline/app/data/models/order.dart';

class OrderService {
  late List<Order> _orders;
  List<Order> get orders => _orders;

  Stream<List<Order>> fetchOrders() => FirebaseFirestore.instance
      .collection("orders")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList());
}
