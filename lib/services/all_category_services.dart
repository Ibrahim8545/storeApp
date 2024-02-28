

import 'package:store/helper/helper.dart';


class AllCategoryServices
{
  Future<List<dynamic>> getAllCategory()async
  {
     List <dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');


    return data;



  }
}