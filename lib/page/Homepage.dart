import 'package:flutter/material.dart';
import 'package:started/models/allproducts.dart';
import 'package:started/services/getallproducts.dart';
import 'package:started/widgets/customCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static String id = 'Homepage';
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Store App',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: FutureBuilder<List<Productmodel>>(
            future: AllProductsServices().getAllproducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Productmodel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 110),
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 100.0,
                  ),
                  itemBuilder: (context, index) {
                    return Customcard(
                      productdata: products[index],
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            }));
  }
}
