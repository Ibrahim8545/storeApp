import 'package:flutter/material.dart';
import 'package:store/widget/Custom_text_field.dart';
import 'package:store/widget/custom_button.dart';

class UpdateProductPage extends StatelessWidget {
 UpdateProductPage({super.key});
  static String id="UpdateProduct";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:const  Text(
          'Update Product',
          style: TextStyle(
            color:Colors.black,
             ),
        ),
         backgroundColor: Colors.transparent,
         centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomTextField(hint: 'Product Name',),
           const SizedBox(height: 10,),
           CustomTextField(hint: 'description',),
           const SizedBox(height: 10,),
           CustomTextField(hint: 'price',),
          const SizedBox(height: 10,),
           CustomTextField(hint: 'image',),
           const SizedBox(height: 50,),
           CustomButton(text: 'Update')
           

          ]
        ),
      ),

    );
  }
}