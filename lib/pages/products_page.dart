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
    // الهواتف الذكية
    Product(
      id: 101,
      name: 'One plus 11 ',
      price: 999,
      description: 'أحدث هاتف one plus 11 مع شريحتين ',
      image: 'assets/images/products/smartphones/oneplus11.jpg',
      categoryId: 1,
      rating: 4.2,
      isAvailable: false,

    ),
    Product(
      id: 102,
      name: 'سامسونج جالاكسي S23',
      price: 899,
      description: 'هاتف أندرويد قوي بكاميرا 200 ميجابكسل',
      image: 'assets/images/products/smartphones/galaxys23.jpg',
      categoryId: 1,
      rating: 4.2,
      isAvailable: false,
    ),

    // أجهزة اللابتوب
    Product(
      id: 201,
      name: 'ماك بوك برو 16 إنش',
      price: 2499,
      description: 'شريحة M2 Pro، رام 16 جيجا، تخزين 512 جيجا',
      image: 'assets/images/products/laptops/macbookpro.jpg',
      categoryId: 2,
      rating: 4.2,
      isAvailable: false,
    ),
    Product(
      id: 202,
      name: 'ديل XPS 15',
      price: 1799,
      description: 'معالج إنتل i7، رام 16 جيجا، شاشة OLED 4K',
      image: 'assets/images/products/laptops/dellxps15.jpg',
      categoryId: 2,
      rating: 4.2,
       isAvailable: false,
    ),

    // الأجهزة الصوتية
    Product(
      id: 301,
      name: 'سوني WH-1000XM5',
      price: 399,
      description: 'سماعات رائدة في إلغاء الضوضاء',
      image: 'assets/images/products/audio/sonyxm5.jpg',
      categoryId: 3,
      rating: 4.2,
      isAvailable: false,

    ),
    Product(
      id: 302,
      name: 'إيربودز برو 2',
      price: 249,
      description: 'إلغاء ضوضاء نشط مع شريحة H2',
      image: 'assets/images/products/audio/airpodspro2.jpg',
      categoryId: 3,
      rating: 4.2,
       isAvailable: true,

    ),

    // الساعات الذكية
    Product(
      id: 401,
      name: 'ساعة أبل الإصدار 8',
      price: 399,
      description: 'مراقبة صحية متقدمة مع مستشعر الحرارة',
      image: 'assets/images/products/smartwatches/applewatch8.jpg',
      categoryId: 4,
      rating: 4.2,
      isAvailable: false,

    ),
    Product(
      id: 402,
      name: 'سامسونج جالاكسي واتش 5 برو',
      price: 449,
      description: 'تصميم متين مع تحليل تكوين الجسم',
      image: 'assets/images/products/smartwatches/galaxywatch5.jpg',
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
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
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
