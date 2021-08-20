import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Arrow Shirt',
      description: 'A Arrow shirt - Sexy!',
      price: 39.99,
      imageUrl: 'images/arrow.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Louis-Philippe',
      description: 'Cool Brand Cool Cloths.',
      price: 59.99,
      imageUrl: 'images/louis-philippe.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Van-Heusen',
      description: 'Formal and Branded - exactly what you need for the Meeting.',
      price:49.99,
      imageUrl: 'images/van-heusen.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Zodiac',
      description: 'Cloths you want.',
      price: 29.99,
      imageUrl: 'images/zodiac.png',
    ),
    Product(
      id: 'p5',
      title: 'asus laptop',
      description: 'Asus Laptop.',
      price: 459.99,
      imageUrl: 'images/asus.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Avita laptop',
      description: 'Avita Laptop.',
      price: 399.99,
      imageUrl: 'images/avita.jpg',
    ),
    Product(
      id: 'p7',
      title: 'hp laptop',
      description: 'HP.',
      price: 599.99,
      imageUrl: 'images/hp.jpg',
    ),
    Product(
      id: 'p8',
      title: 'lenovo laptop',
      description: 'Lenovo Laptop.',
      price: 499.99,
      imageUrl: 'images/lenovo.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Earbuds',
      description: 'Earbuds .',
      price: 49.99,
      imageUrl: 'images/earbuds.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Headphone',
      description: 'Headphone .',
      price: 39.99,
      imageUrl: 'images/headphone.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
