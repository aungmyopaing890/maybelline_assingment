import 'package:maybelline/app/data/models/order.dart';
import 'package:maybelline/app/data/services/order_service.dart';
import 'package:maybelline/app/data/viewmodels/base_model.dart';
import 'package:maybelline/app/locator.dart';

class OrderModel extends BaseModel {
  final OrderService _orderService = locator<OrderService>();

  List<Order> get orders => _orderService.orders;

  Stream<List<Order>> fetchorders() => _orderService.fetchOrders();
}
