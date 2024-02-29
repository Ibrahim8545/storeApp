import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/model/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widget/Custom_text_field.dart';
import 'package:store/widget/custom_button.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "UpdateProduct";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
   ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;


   
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                //doenot need this in sindle child
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hint: 'Product Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      description = data;
                    },
                    hint: 'description',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    hint: 'price',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hint: 'image',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                      onTap: () async{
                        isLoading = true;
                        setState(() {});

                        try {
                           await updateProduct(product);
                          print('sucsess');
                        } on Exception catch (e) {}
                        isLoading = false;
                        setState(() {});

                      },
                      text: 'Update')
                ]),
          ),
        ),
      ),
    );
  }
  

  Future<void> updateProduct(ProductModel product) async{
   await UpdateProductServices().updateProduct (
    id: product.id,
        title:productName==null?product.title: productName!,
        price: price==null?product.price.toString(): price!,
        description: description==null? product.description :description!,
        image: image==null? product.image :image!,
        category: product.category);
  }
}
