import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_application_1/utils/wghit/product_card.dart';

import '../utils/wghit/custum_appbar.dart';


class ProductsPage extends StatelessWidget {
   ProductsPage({super.key,
   required this.catigoriId,
   required this.catigoriTitel,
   });
  final int catigoriId;
  final String catigoriTitel; 

List<Product>  products = [
    // painkillers
    Product(
      id: 101,
      name: 'paraseramol ',
      price: 5500,
      description: ' parasetamol pills to relieve pain and reduce fever',
      image: 'assets/images/products/smartphones/painkillers_3.jpg',
      categoryId: 1,
      rating: 4.2,
      isAvailable: false,

    ),
    Product(
      id: 102,
      name: 'Taplets',
      price: 3500,
      description: 'Pills to relieve pine and reduce fever',
      image: 'assets/images/products/smartphones/painkillers_1.jpg',
      categoryId: 1,
      rating: 4.2,
      isAvailable: true,
    ),

    // vitamins
    Product(
      id: 201,
      name: 'Suja',
      price: 2499,
      description: 'ingredients that contain vitamin C—featuring organic juices and shots crafted to support your daily routine',
      image: 'assets/images/products/laptops/vitamin_1.jpg',
      categoryId: 2,
      rating: 4.2,
      isAvailable: false,
    ),
    Product(
      id: 202,
      name: 'vitamin c',
      price: 1795,
      description: 'An essential water-soluble vitamin, essential for collagen production and wound healing',
      image: 'assets/images/products/laptops/vitamin_2.jpg',
      categoryId: 2,
      rating: 4.2,
       isAvailable: false,
    ),

    //  
    Product(
      id: 301,
      name: 'piotie',
      price: 399,
      description: 'A common dietary supplement used in dosages',
      image: 'assets/images/products/audio/colde_2.jpg',
      categoryId: 3,
      rating: 4.2,
      isAvailable: false,

    ),
    Product(
      id: 302,
      name: 'Nyquil',
      price: 2300,
      description: 'Used to relieve symptoms of cold and flu, such as cough, congestion, and fever',
      image: 'assets/images/products/audio/colde_1.jpg',
      categoryId: 3,
      rating: 4.2,
       isAvailable: true,

    ),

    //  stomach
    Product(
      id: 401,
      name: 'Omepradex',
      price: 2690,
      description: 'Treats Gastroesophageal Reflux Disease',
      image: 'assets/images/products/smartwatches/stomach_1.jpg',
      categoryId: 4,
      rating: 4.2,
      isAvailable: false,

    ),
    Product(
      id: 402,
      name: 'Omeprazole',
      price: 4200,
      description: 'used to treat excess stomach acid conditions including GERD',
      image: 'assets/images/products/smartwatches/stomach_2.jpg',
      categoryId: 4,
      rating: 4.2,
      isAvailable: false,

    ),
  ];

  @override
  Widget build(BuildContext context)  {
    List productFilter=[]; 
    products.forEach((p){
      if(catigoriId ==p.categoryId){
        productFilter.add(p);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
    appBar:  custumAppbar(context,catigoriTitel),
  // bottomNavigationBar: CurvedNavigationBar(
  //   backgroundColor: Colors.blueAccent,
  //   items: <Widget>[
  //     Icon(Icons.add, size: 30),
  //     Icon(Icons.list, size: 30),
  //     Icon(Icons.compare_arrows, size: 30),
  //   ],
  //   onTap: (index) {
  //     //Handle button tap
  //   },
  // ),
    body: ListView.builder
    (itemCount: productFilter.length,
      itemBuilder:
(BuildContext context, int index){

      return ProductCard(
        product: productFilter[index],
      );
    
    
     }),
    
    );
  }
}
