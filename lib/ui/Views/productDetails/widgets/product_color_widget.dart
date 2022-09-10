import 'package:flutter/material.dart';

class ColorsSelector extends StatelessWidget {
  final List<Color> colors;
  const ColorsSelector({
    Key? key,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          colors.length,
          (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Ink(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              )),
    );
  }
}
