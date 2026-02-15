import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_application_1/models/categori.dart';
import 'package:flutter_application_1/utils/wghit/carigoricard.dart';
import 'package:flutter_application_1/utils/wghit/custum_appbar.dart';
import 'package:flutter_application_1/navpar.dart';



class CategorisPage extends StatelessWidget {
   CategorisPage({super.key});
final List catiegories=[
Category(     id: 1,
              tital: "pinkillers",
              image: "assets/images/categories/painkillers.png",),

              Category(
              id: 2,
              tital: "vitamins",
              image: "assets/images/categories/vitamin.png",),
              Category(
              id: 3,
              tital: "colds",
              image: "assets/images/categories/colds.png",),
              Category(
               id: 4, 
              tital: "Stomach",
              image: "assets/images/categories/stomach.png",)              
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(


     //appBar: custumAppbar(context,"الاقسام"),


      body: Padding(padding: const EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          crossAxisSpacing: 15,
          mainAxisExtent: 150 
          ),
          itemCount: catiegories.length,
          itemBuilder: (BuildContext context, int index) {  

            return CategoryCard( category: catiegories[index],);
            
          },
         
      ),
      )
    );
  }


}
