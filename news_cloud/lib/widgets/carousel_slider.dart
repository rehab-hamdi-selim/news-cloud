import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_cloud/data.dart';
import 'package:news_cloud/widgets/category_item.dart';

class CarouselSliderWidget extends StatefulWidget {
  final Function(String) onCategorySelected; // Pass function to HomeScreen

  const CarouselSliderWidget({super.key, required this.onCategorySelected});

  @override
  State<CarouselSliderWidget> createState() => _CarousellSliderWidgetState();
}

class _CarousellSliderWidgetState extends State<CarouselSliderWidget> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.sizeOf(context).height * 0.3,
            enableInfiniteScroll: true,
            reverse: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            autoPlay: true,
            onPageChanged: (value, _) {
              setState(() {
                currentSlider = value;
              });
            },
          ),
          items:
              categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    widget.onCategorySelected(
                      category.name.toLowerCase(),
                    ); // Notify HomeScreen
                  },
                  child: CategoryItem(categoryModel: category),
                );
              }).toList(),
        ),
        SizedBox(height: 10),
        carousalSlider(),
      ],
    );
  }

  carousalSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < categories.length; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 16,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == currentSlider ? Colors.black : Colors.grey,
            ),
          ),
      ],
    );
  }
}
