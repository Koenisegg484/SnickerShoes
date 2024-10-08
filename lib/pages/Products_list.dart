import 'package:flutter/material.dart';
import 'package:snicker_shoes/pages/product_details_page.dart';
import 'package:snicker_shoes/widgets/products_card.dart';

import '../dummydata_for_shop.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {

  List<String> filters = const ["All","Nike","Adidas","Puma","Asics","Fenta", "New Balance"];
  late String selectedfilter;
  final border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.green
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30))
  );

  @override
  void initState() {
    selectedfilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final screensize = MediaQuery.of(context).size;

    return SafeArea(
        child: Column(
          children: [
            //   Child 1
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    "Shoes \nCollection",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                )
              ],
            ),
            //   Child 2
            SizedBox(
              height: 45,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index){
                    final filter = filters[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedfilter = filter;
                            });
                          },
                          child: Chip(label: Text(filter),
                            labelStyle: const TextStyle(fontSize: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: Colors.white)
                            ),
                            backgroundColor: selectedfilter == filter? Colors.limeAccent : Colors.blueGrey.shade50,
                          ),
                        )
                    );
                  }
              ),
            ),
            //   Child 3
            Expanded(
              child: screensize.width > 650 ? GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.69),
                itemBuilder: (context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                      }));
                    },
                    child: ProductsCard(
                        title: product['name'].toString(),
                        price: double.parse(product['price'].toString()),
                        image: product['imageurl'].toString()
                    ),
                  );
                }
              )
              :
              ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                      }));
                    },
                    child: ProductsCard(
                        title: product['name'].toString(),
                        price: double.parse(product['price'].toString()),
                        image: product['imageurl'].toString()
                    ),
                  );
                }
              )
            )
          ],
        )
    );
  }
}