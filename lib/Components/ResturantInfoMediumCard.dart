import 'package:flutter/material.dart';
import 'package:flutter_food/constants.dart';
class ResturantInfoMediumCard extends StatelessWidget {
  const ResturantInfoMediumCard({
    Key? key, required this.title, required this.image, required this.delivery_time, required this.rating, required this.press, required this.location,
  }) : super(key: key);
  final String title,image;
  final int delivery_time;
  final double rating;
  final String location;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onTap:press,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Text(
                location,
                style: const TextStyle(
                  color: kBodyTextColor,
                ),
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 8),
                    decoration: const BoxDecoration(
                        color: kActiveColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        )),
                    child:  Text(
                      rating.toString(),
                      style:const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),

                  Text(
                    '${delivery_time.toString()} min',
                    style: TextStyle(fontSize: 12),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 2,
                    backgroundColor: Color(0xff868686),
                  ),
                  const Spacer(),
                  const Text('Free Delivery'),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
