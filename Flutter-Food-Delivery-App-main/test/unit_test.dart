import 'package:flutter_test/flutter_test.dart';
import 'package:monkey_app_demo/models/cart.dart';
import 'package:monkey_app_demo/models/food_item.dart';

void main() {
  group('Cart Tests', () {
    test('Adding item to cart should increase total', () {
      final cart = Cart();
      final foodItem = FoodItem(
        id: '1',
        name: 'Pizza',
        price: 10.99,
        description: 'Delicious pizza',
        imageUrl: 'assets/images/pizza.jpg',
      );

      cart.addItem(foodItem);
      expect(cart.items.length, 1);
      expect(cart.totalAmount, 10.99);
    });

    test('Removing item from cart should decrease total', () {
      final cart = Cart();
      final foodItem = FoodItem(
        id: '1',
        name: 'Pizza',
        price: 10.99,
        description: 'Delicious pizza',
        imageUrl: 'assets/images/pizza.jpg',
      );

      cart.addItem(foodItem);
      cart.removeItem('1');
      expect(cart.items.length, 0);
      expect(cart.totalAmount, 0.0);
    });

    test('Cart total should be calculated correctly with multiple items', () {
      final cart = Cart();
      final foodItem1 = FoodItem(
        id: '1',
        name: 'Pizza',
        price: 10.99,
        description: 'Delicious pizza',
        imageUrl: 'assets/images/pizza.jpg',
      );
      final foodItem2 = FoodItem(
        id: '2',
        name: 'Burger',
        price: 8.99,
        description: 'Tasty burger',
        imageUrl: 'assets/images/burger.jpg',
      );

      cart.addItem(foodItem1);
      cart.addItem(foodItem2);
      expect(cart.items.length, 2);
      expect(cart.totalAmount, 19.98);
    });
  });

  group('Food Item Tests', () {
    test('Food item should be created with correct properties', () {
      final foodItem = FoodItem(
        id: '1',
        name: 'Pizza',
        price: 10.99,
        description: 'Delicious pizza',
        imageUrl: 'assets/images/pizza.jpg',
      );

      expect(foodItem.id, '1');
      expect(foodItem.name, 'Pizza');
      expect(foodItem.price, 10.99);
      expect(foodItem.description, 'Delicious pizza');
      expect(foodItem.imageUrl, 'assets/images/pizza.jpg');
    });
  });
} 