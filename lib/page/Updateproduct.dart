import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:started/models/allproducts.dart';
import 'package:started/services/updateProduct.dart';
import 'package:started/widgets/customTextFeild.dart';
import 'package:started/widgets/custombutton.dart';

class Updateproductpage extends StatefulWidget {
  Updateproductpage({super.key});
  static String id = 'updatepage';

  @override
  State<Updateproductpage> createState() => _UpdateproductpageState();
}

class _UpdateproductpageState extends State<Updateproductpage> {
  @override
  String? ProductName, desc, image;
  double? price;
  bool islouding = false;
  Widget build(BuildContext context) {
    Productmodel product =
        ModalRoute.of(context)!.settings.arguments as Productmodel;
    return ModalProgressHUD(
      inAsyncCall: islouding,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Customtextfeild(
                  onChanged: (date) {
                    ProductName = date;
                  },
                  hinttext: 'Title',
                ),
                SizedBox(
                  height: 10,
                ),
                Customtextfeild(
                  onChanged: (date) => desc = date,
                  hinttext: 'Decription',
                ),
                SizedBox(
                  height: 10,
                ),
                Customtextfeild(
                  onChanged: (p0) => price = double.parse(p0),
                  hinttext: 'Price',
                ),
                SizedBox(
                  height: 10,
                ),
                Customtextfeild(
                  onChanged: (p0) => image = p0,
                  hinttext: 'Image',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  ontap: () async {
                    islouding = true;
                    setState(() {});
                    try {
                      await Updateproduct(product);
                    } catch (e) {
                      print(e.toString());
                    }
                    islouding = false;
                    setState(() {
                      print('sucessed');
                    });
                  },
                  text: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Updateproduct(Productmodel product) async {
    await UpdateproductService().upproduct(
      ID: product.id,
      title: ProductName == null ? product.title : ProductName!,
      price: price == null ? product.price.toString() : price!.toString(),
      description: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
