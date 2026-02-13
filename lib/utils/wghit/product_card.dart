import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/product_details_page.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ProductDetailsPage(
            productDetails: product,
          )
        
        ));
      },
      child: Container(
        
        margin: const EdgeInsets.all(20),
        padding:  EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 4)
          )
          ],
      
        ),
      //  padding: ,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              
              child: Image.asset(product.image, //متغير الصورة
              width: getProportionalWidth(100),
              height: getProportionalHeight(100),
              fit: BoxFit.cover,
            
              ),
              
            ),
            SizedBox(width: 10,),
             Expanded(child: 
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color:  Colors.black ),
                ),
                SizedBox(height: getProportionalHeight(5),),
      
                Text(' ر.س ${product.price}',
              
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:  Theme.of(context).colorScheme.primary,  
                  ),
                ),
                Row(
                  children: [
                  ...  List.generate(5, (index){
                      return Icon(
                        (index <product.rating.floor()
                        ?Icons.star 
                        :index<product.rating
                        ?Icons.star_half
                        :Icons.star_border),
                      color:  Colors.amber,
                        size: 16,
                        
                      );
                    }),
      
                    const SizedBox(width: 4,),
                    Text('${product.rating}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    ),
                     
                    
                  ],
                ),
                 const SizedBox(width: 4,),
                 if(!product.isAvailable)
                 Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('غير متوفر',
                  style: TextStyle(
                  fontSize: 11,
                fontWeight: FontWeight.w500,
                  ),
                  ),
                  
                 ),
      
              ],
      
             )
             ),
      SizedBox(width: 10,),
                 IconButton(onPressed: (){},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
      
                  )),
          ],
          
        ),
      ),
    );
  }
}