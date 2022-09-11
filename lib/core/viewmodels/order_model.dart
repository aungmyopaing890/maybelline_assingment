import 'package:maybelline/core/models/order.dart';
import 'package:maybelline/core/services/order_service.dart';
import 'package:maybelline/core/viewmodels/base_model.dart';
import 'package:maybelline/locator.dart';

class OrderModel extends BaseModel {
  final OrderService _orderService = locator<OrderService>();

  List<Order> get orders => _orderService.orders;

  Stream<List<Order>> fetchorders() => _orderService.fetchOrders();
}
