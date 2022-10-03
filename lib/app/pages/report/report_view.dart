import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/order.dart';
import 'package:maybelline/app/data/viewmodels/order_model.dart';
import 'package:maybelline/app/pages/base_view.dart';
import 'package:maybelline/app/pages/report/widgets/order_widget.dart';
import 'package:maybelline/app/ui/app_colors.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrderModel>(
        onModelReeady: (model) => model.fetchorders(),
        builder: (BuildContext context, OrderModel model, Widget? child) =>
            Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20.0,
                        color: primaryColor,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Report",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
                backgroundColor: backgroundColor,
                body: StreamBuilder<List<Order>>(
                  stream: model.fetchorders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      final orders = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ...orders.map((e) => OrderWidget(e))
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    }
                  },
                )));
  }
}
