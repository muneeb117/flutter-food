import 'package:flutter/material.dart';
import 'package:flutter_food/constants.dart';
import 'package:flutter_food/demoData.dart';

class ImageCouresal extends StatefulWidget {
  ImageCouresal({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCouresal> createState() => _ImageCouresalState();
}

class _ImageCouresalState extends State<ImageCouresal> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: demoBigImages.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(demoBigImages[index]));
            },
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;

              });
            },
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                demoBigImages.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: defaultPadding / 4),
                  child: IndicatorDot(isActive: index == _currentPage),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
