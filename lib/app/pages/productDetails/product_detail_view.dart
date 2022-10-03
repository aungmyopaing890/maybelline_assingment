import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/data/viewmodels/cart_model.dart';
import 'package:maybelline/app/pages/productDetails/widgets/product_color_widget.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';
import 'package:maybelline/app/pages/widgets/text_form_field.dart';
import 'package:maybelline/app/ui/app_colors.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    CartModel cartModel = context.watch<CartModel>();
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: Responsive.isMobile(context) ? 20 : 22,
              color: primaryColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: Responsive.isMobile(context) ? 200 : 400,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                child: Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Responsive.isMobile(context) ? 20 : 22,
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: Responsive.isMobile(context) ? 20 : 22,
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
                width: Responsive.isMobile(context) ? 250 : 350,
                height: Responsive.isMobile(context) ? 270 : 450,
                child: Image.network(
                  agrs.product.imageLink.toString(),
                  width: Responsive.isMobile(context) ? 250 : 350,
                  height: Responsive.isMobile(context) ? 270 : 450,
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
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: ColorsSelector(
                      colors: agrs.product.productColors != null
                          ? agrs.product.productColors!
                          : [],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.centerLeft,
                    child: Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.isMobile(context) ? 20 : 22),
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
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: Responsive.isMobile(context) ? 20 : 22),
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
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: Responsive.isMobile(context) ? 14 : 16),
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
                          '${agrs.product.priceSign ?? r"$"} ${agrs.product.total}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.isMobile(context) ? 25 : 27),
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
                                  onPressed: () {
                                    cartModel.minus(agrs.product);
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: greyColor,
                                  )),
                              Text(
                                agrs.product.quantity.toString(),
                                style: TextStyle(
                                    fontSize:
                                        Responsive.isMobile(context) ? 15 : 17,
                                    color: greyColor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cartModel.add(agrs.product);
                                  },
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        title: const Center(
                                            child: Text(
                                          "Delivery Info",
                                          style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        content: SingleChildScrollView(
                                          child: SizedBox(
                                            width: Responsive.isMobile(context)
                                                ? 300
                                                : 700,
                                            height: Responsive.isMobile(context)
                                                ? 350
                                                : 500,
                                            child: Form(
                                                key: cartModel.formKey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    Text(
                                                      "Name",
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: Responsive
                                                                  .isMobile(
                                                                      context)
                                                              ? 20
                                                              : 22,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    TextFromFieldWidget(
                                                      controller: cartModel
                                                          .nameController,
                                                      validator: cartModel
                                                          .validateName,
                                                    ),
                                                    Text(
                                                      "Phone No",
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: Responsive
                                                                  .isMobile(
                                                                      context)
                                                              ? 20
                                                              : 22,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    TextFromFieldWidget(
                                                      inputType:
                                                          TextInputType.number,
                                                      controller: cartModel
                                                          .phoneController,
                                                      validator: cartModel
                                                          .validatePhone,
                                                    ),
                                                    Text(
                                                      "Address",
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: Responsive
                                                                  .isMobile(
                                                                      context)
                                                              ? 20
                                                              : 22,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    TextFromFieldWidget(
                                                      lines:
                                                          Responsive.isMobile(
                                                                  context)
                                                              ? 4
                                                              : 6,
                                                      controller: cartModel
                                                          .addressController,
                                                      validator: cartModel
                                                          .validateAddress,
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        actions: [
                                          Center(
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.0)),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(13.0),
                                                onTap: () {
                                                  cartModel
                                                      .makeOrder(agrs.product);
                                                },
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 25,
                                                        vertical: 10),
                                                    child: Text(
                                                      "ORDER",
                                                      style: TextStyle(
                                                          fontSize: Responsive
                                                                  .isMobile(
                                                                      context)
                                                              ? 20
                                                              : 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  "Cart",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Responsive.isMobile(context)
                                          ? 22
                                          : 24,
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
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
