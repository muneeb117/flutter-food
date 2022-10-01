import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({
    Key? key, required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      elevation: 0,
      expandedHeight: 200,

      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(image,fit: BoxFit.cover,),
      ),

      leading: Padding(
        padding:  const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
              child: SvgPicture.asset('assets/icons/back.svg',)),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset('assets/icons/share.svg',color: Colors.black,),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset('assets/icons/search.svg',color: Colors.black,),
          ),
        ),

      ],

    );
  }
}
