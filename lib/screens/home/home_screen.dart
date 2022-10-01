import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Components/models/menu.dart';
import 'package:flutter_food/screens/components/RestaurentAppBar.dart';
import 'package:flutter_food/screens/components/restaurant_info.dart';
import 'package:flutter_food/screens/components/restaruant_categories.dart';

import '../components/menu_card.dart';




class RestaurantPage extends StatefulWidget {
  final String image;
  final String shopName;
  RestaurantPage(this.image, this.shopName);


  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {



  final scrollController = ScrollController();
  double restaurentInfoHeight = 200 + 170 - kToolbarHeight;
  int selectedCategoryIndex=0;


  void scrollToCategory(int index) {
    if (selectedCategoryIndex!=index){
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }
      scrollController.animateTo(
          restaurentInfoHeight + (116 * totalItems) + (50 * index),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn
      );
    }
    setState(() {
      selectedCategoryIndex=index;
    });

  }
  List<double>breakPoints=[];
  void createBreakPoint(){
    double firstBreakPoint=restaurentInfoHeight+(116*demoCategoryMenus[0].items.length);
    breakPoints.add(firstBreakPoint);
    for(var i=0;i<demoCategoryMenus.length;i++){
      double breckPoints=breakPoints.last+50 +(116*demoCategoryMenus[i].items.length);
      breakPoints.add(breckPoints);
    }
  }
  void updateCategoryIndexOnScroll(double offset){
    for (var i=0;i<demoCategoryMenus.length;i++){
      if (i==0){
        if((offset<breakPoints.first) & (selectedCategoryIndex!=0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      }

      else if((breakPoints[i-1]<=offset)&(offset<breakPoints[i])){
        if(selectedCategoryIndex!=i){
          setState(() {
            selectedCategoryIndex=i;
          });

        }


      }

    }

  } @override
  void initState() {
    createBreakPoint();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
           RestaurantAppBar( image:widget.image,),
           SliverToBoxAdapter(
            child: RestaurantInfo(widget.shopName),
          ),
          SliverPersistentHeader(
            delegate: RestaurantCategories(
                selectedIndex: selectedCategoryIndex, onChanged: scrollToCategory),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, CategoryIndex) {
                List<Menu> items = demoCategoryMenus[CategoryIndex].items;
                return MenuCategoryItem(
                  title: demoCategoryMenus[CategoryIndex].category,
                  items: List.generate(
                      items.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: MenuCard(
                          title: items[index].title,
                          image: items[index].image,
                          price: items[index].price),
                    );
                  }),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
