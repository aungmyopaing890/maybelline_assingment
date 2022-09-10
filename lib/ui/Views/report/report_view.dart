import 'package:flutter/material.dart';
import 'package:maybelline/ui/shared/app_colors.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                color: cardColor,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "John",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            r"$ 14.99",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: const Text("09969625819",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("No 32, BlahBlah Road, Yangon",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                color: cardColor,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "John",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            r"$ 14.99",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: const Text("09969625819",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("No 32, BlahBlah Road, Yangon",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                color: cardColor,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "John",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            r"$ 14.99",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: const Text("09969625819",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("No 32, BlahBlah Road, Yangon",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                color: cardColor,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "John",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            r"$ 14.99",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: const Text("09969625819",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("No 32, BlahBlah Road, Yangon",
                          style: TextStyle(color: greyColor, fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
