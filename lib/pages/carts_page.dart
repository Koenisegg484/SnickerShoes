import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snicker_shoes/providers/cart_provider.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({super.key});

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart = context.watch<CartProvider>().cart;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child:Column(
          children: [
            Text("Your Products...", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Expanded(child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index){
                final cartItem = cart[index];

                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(cartItem['imageurl'].toString()),),
                  title: Text(cartItem['name'].toString(),style: Theme.of(context).textTheme.bodySmall,),
                  subtitle: Text("Size : ${cartItem['size'].toString()}"),

                  // trailing: Icon(Icons.delete, color: Colors.red,),
                  trailing: IconButton(
                      onPressed: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Remove Snicks", style: Theme.of(context).textTheme.titleMedium,),
                            content: Text("Confirm to remove your snicks.", style: Theme.of(context).textTheme.bodyMedium),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),)
                              ),
                              TextButton(
                                  onPressed: (){
                                    context.read<CartProvider>().removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Remove", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),)
                              ),

                            ],
                          );
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.red,)),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

                );
              })
            )

          ],
        ),
      );
  }
}
