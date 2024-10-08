import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {

  final String title;
  final double price;
  final String image;

  const ProductsCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      constraints: BoxConstraints(
        minWidth: 230,
        maxWidth: 230,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
              child: Image(
                image: AssetImage(image),
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
            ),]
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$price",
                style: Theme.of(context).textTheme.bodySmall
                ),
              const Icon(
                Icons.shopping_cart,
                size: 30,

              )
            ],
          )

        ],
      ),
    );
  }
}
