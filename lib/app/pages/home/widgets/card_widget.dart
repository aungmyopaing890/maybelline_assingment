import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/pages/productDetails/product_detail_view.dart';
import 'package:maybelline/app/ui/app_colors.dart';

class CardWidget extends StatelessWidget {
  final Product product;
  const CardWidget(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/productDetail',
          arguments: ProductDetailsArguments(product: product),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 150,
        height: 300,
        child: Card(
          color: cardColor,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    width: 130.0,
                    height: 150.0,
                    child: Image.network(product.imageLink.toString()),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                child: Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: const TextStyle(color: titleColor),
                      text: product.name,
                    ),
                  ),
                ),
              ),
              Text(
                product.productType.toString(),
                style: const TextStyle(fontWeight: FontWeight.w100),
              ),
              Text(
                '${product.priceSign ?? r"$"} ${product.price}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
