
import 'package:flutter/material.dart';
import 'package:news_cloud/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      child: Column(
        spacing: 15,
        children: [
          Image(
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height*0.2,
            width: MediaQuery.sizeOf(context).width,
            image: AssetImage(categoryModel.image,),
          ),
          Expanded(
            child: Text(
              categoryModel.name,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
