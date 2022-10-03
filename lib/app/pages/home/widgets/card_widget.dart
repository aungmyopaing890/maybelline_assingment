import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/pages/productDetails/product_detail_view.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';
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
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: Responsive.isMobile(context) ? 150 : 300,
          height: Responsive.isMobile(context) ? 300 : 300,
          child: Card(
            color: cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      width: Responsive.isMobile(context) ? 150 : 300,
                      height: Responsive.isMobile(context) ? 300 : 300,
                      child: Image.network(
                        product.imageLink.toString(),
                        width: Responsive.isMobile(context) ? 100 : 150,
                        height: Responsive.isMobile(context) ? 200 : 300,
                        fit: BoxFit.cover,
                      ),
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
                        style: TextStyle(
                            color: titleColor,
                            fontSize: Responsive.isMobile(context) ? 18 : 20),
                        text: product.name,
                      ),
                    ),
                  ),
                ),
                Text(
                  product.productType.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: Responsive.isMobile(context) ? 16 : 18),
                ),
                Text(
                  '${product.priceSign ?? r"$"} ${product.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.isMobile(context) ? 20 : 22),
                )
              ],
            ),
          ),
        ));
  }
}
