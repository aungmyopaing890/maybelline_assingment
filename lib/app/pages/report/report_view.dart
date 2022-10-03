import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/order.dart';
import 'package:maybelline/app/data/viewmodels/order_model.dart';
import 'package:maybelline/app/pages/base_view.dart';
import 'package:maybelline/app/pages/report/widgets/order_widget.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';
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
                    elevation: 0,
                    toolbarHeight: Responsive.isMobile(context) ? 100 : 130,
                    automaticallyImplyLeading: false,
                    title: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Ink(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: outlineColor, width: 3),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13.0)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(13.0),
                              onTap: () => Navigator.of(context).pop(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 5, top: 10, bottom: 10),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: Responsive.isMobile(context) ? 28 : 30,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Report",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        Responsive.isMobile(context) ? 24 : 26,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
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
