import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/display.dart';
import 'package:flutter_application_1/utils/wghit/display.dart';
import 'package:flutter_application_1/widgets/display.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final treatments = [
      Treatment(
        image: 'assets/images/display/scolar.jpg',
        title: 'جلسة ليزر',
        oldPrice: 300,
        newPrice: 200,
        
      ),
      Treatment(
        image: 'assets/images/display/alegon.png',
        title: 'تنظيف بشرة',
        oldPrice: 250,
        newPrice: 180,
      ),
      Treatment(
        image: 'assets/images/display/refnix.jpg',
        title: 'فيلر شفاه',
        oldPrice: 900,
        newPrice: 750,
      ),
      Treatment(
        image: 'assets/images/display/719GTNx4QRL.jpg',
        title: 'بوتوكس',
        oldPrice: 1200,
        newPrice: 950,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 230,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: treatments.length,
          itemBuilder: (context, index) {
            return TreatmentCard(
              treatment: treatments[index],
            );
          },
        ),
      ),
    );
  }
}
