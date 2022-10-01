

import 'package:flutter/material.dart';
import 'package:flutter_food/constants.dart';
class appBarWithFilter extends StatelessWidget {
  const appBarWithFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        children: [
          Text(
            'Delivery to'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: kActiveColor),
          ),
          const Text(
            'San Francisco',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Filter',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
