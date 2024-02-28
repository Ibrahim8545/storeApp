

import 'package:store/helper/helper.dart';
import 'package:store/model/product_model.dart';

class AddProductServices
{
  Future<ProductModel>addProduct({
    required String title,
    required String price,
    required String description,
    required String image , 
    required String category})async
  {
       Map<String, dynamic> data= await Api().post(url:'https://fakestoreapi.com/products',
        body: 
        {
          'title':title,
           'price':price,
           'description' :description,
           'image'  :    image,
           'category   '   :category,

        },
        
       );

    List<ProductModel>productList=[];

    for (int i=0;i<data.length;i++)
    {
      productList.add(
        ProductModel.fromJson(data[i])
      );
    }
    return ProductModel.fromJson(data);




  }
  
}