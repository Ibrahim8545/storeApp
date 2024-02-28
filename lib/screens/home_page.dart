import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/model/product_model.dart';
import 'package:store/services/get_all_product.dart';
import 'package:store/widget/custom_card.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.cartPlus)),
        ],
      ),
      body:Padding(
        padding:  EdgeInsets.only(left: 16,right: 16,top:65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProduct(),
           builder:(context,snapshot)
           {
            if(snapshot.hasData) {
                List<ProductModel> products=snapshot.data!;
             return GridView.builder(
              itemCount: products.length,
          //donot cut any thing of card 
          clipBehavior: Clip.none,
          //option to control gridview
          gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
            //number of count of widget
            crossAxisCount:2,
            //control height and width(dy)
            childAspectRatio: 1.5,
            // control dx
            crossAxisSpacing: 10,
            mainAxisSpacing: 100
            ),
           itemBuilder: (context,index)
           {
            return  CustomCard(product: products[index],);
           }
           );

            }
            else
            {
              return Center(child: CircularProgressIndicator());
            }
           }
           )
      ),
      
    );
  }
}



