import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maybelline/core/models/product.dart';
import 'package:maybelline/ui/shared/app_colors.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                child: Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      text: agrs.product.name.toString(),
                    ),
                  ),
                ),
              ),
              Ink(
                decoration: BoxDecoration(
                    border: Border.all(color: outlineColor, width: 3),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(13.0),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 20.0,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          )),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 250.0,
                height: 270.0,
                child: Image.network(
                  agrs.product.imageLink.toString(),
                  height: 250,
                  width: 270,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              color: cardColor,
              child: Column(
                children: [
                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 25, vertical: 10),
                  //   child: ColorsSelector(
                  //     colors: [],
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.centerLeft,
                    child: Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          text: agrs.product.name,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 10, top: 5),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          agrs.product.productType.toString(),
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        RatingBarIndicator(
                          rating: agrs.product.rating != null
                              ? agrs.product.rating!
                              : 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: primaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        text: agrs.product.description,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: const Divider(
                      thickness: 1.5,
                      color: dividerColor,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 18, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${agrs.product.priceSign ?? r"$"} ${agrs.product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: outlineColor, width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    color: greyColor,
                                  )),
                              const Text(
                                "1",
                                style:
                                    TextStyle(fontSize: 15, color: greyColor),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: greyColor,
                                  ))
                            ],
                          ),
                        ),
                        Ink(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(13.0)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(13.0),
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  "Cart",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
