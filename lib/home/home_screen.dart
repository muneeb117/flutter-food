
import 'package:flutter/material.dart';
import 'package:flutter_food/Components/ImageCrousal.dart';
import 'package:flutter_food/Components/ResturantInfoMediumCard.dart';

import 'package:flutter_food/Components/appBar.dart';
import 'package:flutter_food/constants.dart';
import 'package:flutter_food/Components/section_title.dart';
import 'package:flutter_food/demoData.dart';
import 'package:flutter_food/screens/home/home_screen.dart';

class HomeScreen extends StatefulWidget {



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const appBarWithFilter(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(child: ImageCouresal()),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SectionTile(
                text: 'Featured Partners',
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                List.generate(demoMediumCardData.length, (index) =>
                  Padding(
                    padding: const EdgeInsets.only(left:defaultPadding),
                    child: ResturantInfoMediumCard(
                      title: demoMediumCardData[index]['name'],
                      location: demoMediumCardData[index]['location'],
                      image: demoMediumCardData[index]['image'],
                      rating: demoMediumCardData[index]['rating'],
                      delivery_time: demoMediumCardData[index]['delivertTime'],
                      press:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>RestaurantPage(demoMediumCardData[index]['image'],demoMediumCardData[index]['name']) ),
                        );
                      }

                    ),
                  ),

                  ),

              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Image.asset('assets/images/Banner.png',),

            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SectionTile(
                text: 'Best Pick',
                press:(){},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                List.generate(demoMediumCardData.length, (index) =>
                    Padding(
                      padding: const EdgeInsets.only(left:defaultPadding,bottom: defaultPadding),
                      child: ResturantInfoMediumCard(
                        title: demoMediumCardData[index]['name'],
                        location: demoMediumCardData[index]['location'],
                        image: demoMediumCardData[index]['image'],
                        rating: demoMediumCardData[index]['rating'],
                        delivery_time: demoMediumCardData[index]['delivertTime'],
                          press:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  RestaurantPage(demoMediumCardData[index]['image'],demoMediumCardData[index]['name']) ),
                            );
                          }
                      ),
                    ),

                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
