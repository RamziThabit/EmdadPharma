import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categori.dart';
import 'package:flutter_application_1/pages/products_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
   required this.category,

  });
  
final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      splashColor: Colors.brown,
      borderRadius: BorderRadius.circular(25),
      onTap: () {
          Navigator.push(context, MaterialPageRoute(
          builder:(context)=> ProductsPage(
            catigoriId: category.id,
            catigoriTitel: category.tital,
            )
          ));
      } ,
      child: Card(
       
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),  
      child: Stack(
      alignment: Alignment.center,
      children: [
        
                
                 Image.asset(category.image,
                 width: double.infinity,
                 height: double.infinity,
                 fit: BoxFit.fill,
                 ),
               Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),),  
                gradient: LinearGradient(
      begin: AlignmentGeometry.bottomCenter,
      end: Alignment.topCenter,
      colors: [ Colors.black.withOpacity(.7), Colors.transparent]
                ),
              ),
            ) ,
                // Alignment: Alignment.Center,  
               
                 Positioned(
      bottom: 0,
      right: 0,
      
      
       child: Row( 
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,                        
          children: [               
          Container(
            //  color: Theme.of(context).colorScheme.primary,
              height: getProportionalHeight(28),
              width: getProportionalWidth(7),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            
           SizedBox(width: getProportionalWidth(15),),
      
          Text(category.tital,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          )
         
          ],
         ),
                 )
        ],
      ) , 
      ),
    );
  }
}