class Products {
  final String item_id;
  final String item_name;
  final double price;
  final int qty;

  Products({
    required this.item_id,
    required this.item_name,
    required this.price,
    required this.qty,
  });

  Map<String, dynamic> toJson() => {
        'item_id': item_id,
        'item_name': item_name,
        'price': price,
        'qty': qty,
      };

  static Products fromJson(Map<String, dynamic> json) => Products(
        item_id: json['item_id'],
        item_name: json['item_name'],
        price: json['price'],
        qty: json['qty'],
      );
}
