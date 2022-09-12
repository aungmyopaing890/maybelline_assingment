import 'package:flutter/material.dart';
import 'package:maybelline/core/enum/viewstate.dart';
import 'package:maybelline/core/viewmodels/home_model.dart';
import 'package:maybelline/ui/Views/base_view.dart';
import 'package:maybelline/ui/Views/home/widgets/card_widget.dart';
import 'package:maybelline/ui/shared/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReeady: (model) => model.fetchProducts(),
      builder: (BuildContext context, HomeModel model, Widget? child) =>
          Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  elevation: 0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: outlineColor, width: 3),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.0)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(13.0),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/report',
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.note_alt_sharp,
                              size: 20.0,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const Text("Maybeline",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
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
              body: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: TextField(
                      cursorColor: Colors.grey.shade200,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 0.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        hintText: 'Search the products ...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  model.state == ViewState.Busy
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: model.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.60,
                              ),
                              itemBuilder: (context, index) =>
                                  CardWidget(model.products[index])),
                        ),
                ],
              )),
    );
  }
}
