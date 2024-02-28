import 'package:store/helper/helper.dart';
import 'package:store/model/product_model.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];

    for (int i = 0; i < data.length; i++) 
    {
      productList.add(ProductModel.fromJson(data[i])
        );
    }
    return productList;
  }
}


// http.Response response= await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if(response.statusCode==200)
//     {
//           List <dynamic> data=jsonDecode(response.body);

//     List<ProductModel>productList=[];

//     for (int i=0;i<data.length;i++)
//     {
//       productList.add(
//         ProductModel.fromJson(data[i])
//       );
//     }
//     return productList;