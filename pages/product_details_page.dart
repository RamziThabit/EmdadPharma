import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/utils/SizeOfConfig.dart';
import 'package:flutter_application_1/utils/custom_button.dart';
import 'package:flutter_application_1/utils/wghit/custum_appbar.dart';

class ProductDetailsPage extends StatefulWidget {
   ProductDetailsPage({super.key,
   required this.productDetails,
   });

  final Product productDetails;
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
 @override
void initState() {
  super.initState();
  counter=1;
}
int counter=1;

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: custumAppbar(context, widget.productDetails.name),



      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:  BorderRadius.circular(12),
                child: Image.asset(
                  widget.productDetails.image,
                  height: getProportionalHeight(300),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20,),
               Text(
                widget.productDetails.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // الوصف
              Text(
               widget.productDetails.description!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 20),

              // السعر
               Text(
                "${widget.productDetails.price} ر.ي",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),

              const SizedBox(height: 24),

              // الكمية
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "الكمية",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // أزرار التحكم بالكمية
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // زر الطرح
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if(counter>1){
                                counter--;

                              }
                              
                            });
                            
                            print(counter);
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.deepOrange,
                        ),

                        // الكمية
                        Container(
                          width: getProportionalWidth(40),
                          alignment: Alignment.center,
                          child:  Text(
                            "$counter",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // زر الإضافة
                        IconButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                            
                            print(counter);
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // المجموع
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المجموع",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                     Text(
                      "${widget.productDetails.price * counter} ر.ي",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),


              CustomButton(
                title: ' اضافة الى السلة',
               icon:  Icon(Icons.shopping_cart),
               onPreeesd: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.white),
                            const SizedBox(width: 12),
                            Text('تمت إضافة المنتج للسلة'),
                          ],
                        ),
                        backgroundColor: const Color.fromARGB(255, 205, 161, 228),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
               },
              ),
 
              
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
           
            //  // زر الإضافة للسلة
            //   SizedBox(
            //     width: double.infinity,
            //     height: getProportionalHeight(56),
            //     child: ElevatedButton.icon(
            //       onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Row(
                    //       children: [
                    //         const Icon(Icons.check_circle, color: Colors.white),
                    //         const SizedBox(width: 12),
                    //         Text('تمت إضافة المنتج للسلة'),
                    //       ],
                    //     ),
                    //     backgroundColor: Colors.green,
                    //     behavior: SnackBarBehavior.floating,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //   ),
                    // );
            //       },
            //       icon: const Icon(Icons.shopping_cart),
            //       label: const Text(
            //         "اضافة الى السلة",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Theme.of(context).colorScheme.primary,
            //         foregroundColor: Theme.of(context).colorScheme.onPrimary,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(16),
            //         ),
            //       ),
            //     ),
            //   ),
///////////////////////////////////////////////////////////////////////////////////////////////
            ]
          ),
        ),
      ),
    );
  }
}