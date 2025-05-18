import 'food_item.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class Cart {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(FoodItem foodItem) {
    if (_items.containsKey(foodItem.id)) {
      _items.update(
        foodItem.id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        foodItem.id,
        () => CartItem(
          id: foodItem.id,
          name: foodItem.name,
          price: foodItem.price,
          quantity: 1,
        ),
      );
    }
  }

  void removeItem(String id) {
    _items.remove(id);
  }

  void clear() {
    _items.clear();
  }
} 