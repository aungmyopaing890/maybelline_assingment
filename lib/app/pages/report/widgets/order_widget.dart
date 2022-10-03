import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/order.dart';
import 'package:maybelline/app/ui/app_colors.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget(this.order, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: cardColor,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.name.toString(),
                    style: const TextStyle(
                        color: greyColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${order.priceSign ?? r"$"} ${order.total}',
                    style: const TextStyle(
                        color: greyColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(order.phone.toString(),
                  style: const TextStyle(color: greyColor, fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(order.address.toString(),
                  style: const TextStyle(color: greyColor, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
