import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_application_1/models/categori.dart';
import 'package:flutter_application_1/utils/wghit/carigoricard.dart';
import 'package:flutter_application_1/utils/wghit/custum_appbar.dart';


class CategorisPage extends StatelessWidget {
   CategorisPage({super.key});
final List catiegories=[
Category(     id: 1,
              tital: "هواتف",
              image: "assets/images/categories/smart-phones.png",),

              Category(
              id: 2,
              tital: "الحواسيب",
              image: "assets/images/categories/laptop.png",),
              Category(
              id: 3,
              tital: "سماعات",
              image: "assets/images/categories/audio-devices.png",),
              Category(
               id: 4, 
              tital: "الاجهزة الصوتية",
              image: "assets/images/categories/smart-watches.png",)

             
              
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: custumAppbar(context,"الاقسام"),


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
