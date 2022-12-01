// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';

import '../../../constants.dart';



// import 'package:flutter/material.dart';
// import 'package:ecommerce/components/search_box.dart';
// import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/details/details_screen.dart';

// import 'category_list.dart';
// import '../../../sample.dart';
import 'product_card.dart';


// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['All', 'Sofa', 'Park bench', 'Armchair'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
// if(index==1){
//             Text('PRESSED');
//             print('pre');
// Navigator.push(context, MaterialPageRoute(builder: ((context) => const MyWidget())));

// }
//             });

//           },
          
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
