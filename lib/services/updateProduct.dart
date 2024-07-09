import 'package:started/helper/Api.dart';
import 'package:started/models/allproducts.dart';

class UpdateproductService {
  Future<Productmodel> upproduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required int ID,
    required String category,
  }) async {
    print('product id =$ID');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$ID', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return Productmodel.fromJson(data);
  }
}
