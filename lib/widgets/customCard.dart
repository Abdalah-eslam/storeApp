import 'package:flutter/material.dart';
import 'package:started/models/allproducts.dart';
import 'package:started/page/Updateproduct.dart';

class Customcard extends StatelessWidget {
  Customcard({super.key, required this.productdata});
  Productmodel productdata;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Updateproductpage.id,
            arguments: productdata);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 120,
          width: 230,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 100,
                  spreadRadius: 0,
                  offset: Offset(10, 10))
            ],
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${productdata.title.substring(0, 12)}',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${productdata.price}' r'$',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 50,
          top: -80,
          child: Image.network(
            productdata.image,
            fit: BoxFit.contain,
            height: 120,
            width: 100,
          ),
        )
      ]),
    );
  }
}
