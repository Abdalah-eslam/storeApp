import 'package:started/helper/Api.dart';
import 'package:started/models/allproducts.dart';

class Addproduct {
  Future<Productmodel> addproduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return Productmodel.fromJson(data);
  }
}
