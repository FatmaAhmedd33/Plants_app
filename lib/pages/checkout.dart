// ignore_for_file: prefer_const_constructors

import 'package:flower_app/contants.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/widgets/custom_appbar.dart';

import 'package:flower_app/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});
  static String id = 'CheckOutPage';

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("checkout screen"),
        actions: const [ProductsAndPrice()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              // padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 550,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: carttt.selectedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(carttt.selectedProducts[index].name),
                          subtitle: Text(
                              "${carttt.selectedProducts[index].price} - ${carttt.selectedProducts[index].location}"),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                carttt.selectedProducts[index].imgPath),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                carttt.delete(carttt.selectedProducts[index]);
                              },
                              icon: Icon(Icons.remove)),
                        ),
                      );
                    }),
              ),
            ),
            /*ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BTNpink),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              child: Text(
                "Pay \$${carttt.price}",
                style: TextStyle(fontSize: 19),
              ),
            ),*/
            CustomButton(text: "total ${carttt.price} \$")
          ],
        ),
      ),
    );
  }
}
