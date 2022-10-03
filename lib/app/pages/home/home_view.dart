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
                Text("Maybeline",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Responsive.isMobile(context) ? 20 : 22,
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
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextField(
                  cursorColor: Colors.grey.shade200,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 0.0),
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
                            Responsive.isMobile(context) ? 0.60 : 0.90,
                        mainAxisSpacing: 10.0,
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
