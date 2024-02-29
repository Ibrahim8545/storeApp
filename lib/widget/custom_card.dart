import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:store/screens/update_product.dart';

class CustomCard extends StatefulWidget {
   CustomCard({
    super.key,
    required this .product
  });
ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
 
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: widget.product );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
        Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2),
              //distance of shadow
              spreadRadius: 0,
              offset: Offset(10, 10)
      
            )
          ]
        ),
        
        child:  Card(
        
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0 ,vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 widget.product.title.substring( 0,6),
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const  SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     r'$''${widget.product.price.toString()}',
                      style:const  TextStyle(
                        fontSize: 16,
                      ),
                    ),
                     GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                          color: isLiked ? Colors.red : Colors.grey[110]                                                                                                                                                                                                                           ,
                          ),
                        ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),  
      Positioned(
        right: 32,
      top: -60,
      
        child: Image.network(
          widget.product.image,
          height: 100,
          width: 100,
          ),
      )
      
        ],
        ),
    );
  }
}