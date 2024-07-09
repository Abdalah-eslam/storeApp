import 'package:started/helper/Api.dart';
import 'package:started/models/allproducts.dart';

class AllProductsServices {
  Future<List<Productmodel>> getAllproducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<Productmodel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(Productmodel.fromJson(data[i]));
    }
    return productList;
  }
}
