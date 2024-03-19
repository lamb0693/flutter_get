import 'package:flutter_get/model/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController{

    final RxList<Product> products = <Product>[].obs;

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 3));

    List<Product> productData = [
      Product(1, "Gram", "Gram Notebook", 1500),
      Product(2, "Galaxy", "Galaxy S24", 1200),
      Product(3, "IPad", "IPad tablet", 820),
      Product(4, "Macbook", "Macbook Notebook", 1930),
      Product(5, "Xiomi", "Xiaomi Phone", 700),
      Product(6, "IPhone", "Iphone X15", 1430),
    ];

    products.assignAll(productData);
    print("products ${products}");
  }
}