import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snicker_shoes/providers/cart_provider.dart';


class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late Map<String, Object> product;
  int size = 0;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  void onTap(BuildContext context){
    if(size!= 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': product['id'],
        'name': product['name'],
        'price': product['price'],
        'imageurl': product['imageurl'],
        'size': size
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your snicks are waiting in cart.")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Select a size first.")));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
          leading: Icon(Icons.arrow_back_ios, color: Colors.blueGrey,),
          title: Text("Details",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text("Article : ${product['name']}",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            const Spacer(),
            // Image.asset(product['imageurl'].toString(), fit: BoxFit.scaleDown,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                  image: AssetImage(product['imageurl'].toString()),
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.fill
              ),
            )),
            const Spacer(flex: 2,),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  //   Price
                  Text("\$${product['price']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Select a size : ", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'OpenSans'
                    ),),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (product['sizes'] as List<int>).length,
                        itemBuilder: (context, index){
                          final size1 = (product['sizes'] as List<int>)[index];
                          return Padding(padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  size = size1;
                                });
                              },
                              child: Chip(
                                padding: EdgeInsets.all(5),
                                backgroundColor: size == size1?Theme.of(context).colorScheme.primaryContainer:null,
                                label: Text(
                                  size1.toString(),
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black))
                              ),
                            )
                          ,);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton.icon(
                      onPressed: () => onTap(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          minimumSize: Size(double.infinity, 50)
                      ),
                      icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,),
                      label: Text("Add to cart",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}