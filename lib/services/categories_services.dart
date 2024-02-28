

import 'package:store/helper/helper.dart';
import 'package:store/model/product_model.dart';

class CategoriesService
{

// catergoryName is path variable 
    Future<List<ProductModel>>getAllProduct ({required String categoryName})async
  {
   List <dynamic> data= await Api().get(url: 'https:fakestoreapi.com/products/category/$categoryName');

    List<ProductModel>productList=[];

    for (int i=0;i<data.length;i++)
    {
      productList.add(
        ProductModel.fromJson(data[i])
      );
    }
    return productList;



  }


}