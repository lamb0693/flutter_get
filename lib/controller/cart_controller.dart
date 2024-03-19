import 'package:get/get.dart';

import '../model/product.dart';

class CartController extends GetxController{

  final RxList<Product> cartItems = <Product>[].obs;

  double getTotalPrice() {
    double sum = 0;
    for(int i=0; i<cartItems.length; i++){
      sum+= cartItems[i].price;
    }

    return sum;
  }

  void addToCart(Product product){
    cartItems.add(product);
  }



}