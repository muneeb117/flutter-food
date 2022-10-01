import 'package:flutter/material.dart';
import 'package:flutter_food/constants.dart';
class SectionTile extends StatelessWidget {
  const SectionTile({
    Key? key, required this.text, required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
        TextButton(
          onPressed:press,
          style: TextButton.styleFrom(
              primary: kActiveColor
          ),
          child:  const Text(
            'See All',
          ),
        ),
      ],
    );
  }
}
