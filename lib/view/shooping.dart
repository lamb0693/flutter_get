import 'package:flutter/material.dart';
import 'package:flutter_get/controller/cart_controller.dart';
import 'package:flutter_get/controller/shopping_controller.dart';
import 'package:get/get.dart';

class ShoppingMainPage extends StatelessWidget {
  ShoppingMainPage({super.key});

  final shoppingController = Get.put(ShoppingController()); //Do not miss ()***
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Main'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  if(controller.products.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(controller.products[index].name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(controller.products[index].description,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text("${controller.products[index].price}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<
                                          Color>(Colors.blue),
                                      // Set the desired background color
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.fromLTRB(15, 0, 15,
                                            0), // Set the desired padding value
                                      ),
                                    ),
                                    onPressed: () {
                                      cartController.addToCart(shoppingController.products[index]);
                                    },
                                    child: const Text("Add to Cart",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all()
              ),
              child: GetX<CartController>(
                builder: (controller) {
                  return Text('Total price :${controller.getTotalPrice()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    onPressed: (){},
                    label: const Text("쇼핑카트"),
                    icon: const Icon(Icons.shopping_cart_checkout),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
