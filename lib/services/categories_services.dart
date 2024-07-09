import 'package:started/helper/Api.dart';
import 'package:started/models/allproducts.dart';

class CategoriesServices {
  Future<List<Productmodel>> getCategoriesServices(
      {required category_name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');
    List<Productmodel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(Productmodel.fromJson(data[i]));
    }
    return productList;
  }
}
