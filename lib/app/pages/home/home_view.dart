import 'package:flutter/material.dart';
import 'package:maybelline/app/data/enum/viewstate.dart';
import 'package:maybelline/app/pages/base_view.dart';
import 'package:maybelline/app/pages/home/home_model.dart';
import 'package:maybelline/app/pages/home/widgets/card_widget.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';
import 'package:maybelline/app/ui/app_colors.dart';

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
            toolbarHeight: Responsive.isMobile(context) ? 100 : 130,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.note_alt_sharp,
                          size: Responsive.isMobile(context) ? 26 : 30,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Text("Maybeline",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Responsive.isMobile(context) ? 24 : 28,
                          fontWeight: FontWeight.bold)),
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
                          size: Responsive.isMobile(context) ? 26 : 30,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  cursorColor: Colors.grey.shade100,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade100, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade100, width: 0.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                        size: Responsive.isMobile(context) ? 28 : 30,
                      ),
                      onPressed: () {},
                    ),
                    hintText: 'Search the products ...',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Responsive.isMobile(context) ? 16 : 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            )),
            model.state == ViewState.Busy
                ? const SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  )
                : SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            Responsive.isMobile(context) ? 0.60 : 0.67,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 10.0),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CardWidget(model.products[index]);
                      },
                      childCount: model.products.length,
                    ),
                  ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 80.0),
            )
          ],
        ),
      ),
    );
  }
}
