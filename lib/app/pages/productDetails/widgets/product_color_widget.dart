import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';

class ColorsSelector extends StatelessWidget {
  final List<ProductColor> colors;
  const ColorsSelector({
    Key? key,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.isMobile(context) ? 40 : 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Ink(
                  width: Responsive.isMobile(context) ? 30 : 40,
                  decoration: BoxDecoration(
                      color: colors[index].color,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            );
          }),
    );
  }
}
