

class Products {
  final String image;
  final String title;
  final int rate;
  final String sold;
  final String location;
  final String price;
  bool liked;

  Products({
    required this.image,
    required this.title,
    required this.rate,
    required this.sold,
    required this.location,
    required this.price,
    required this.liked,
  });

  Map<String, dynamic> toJson() => {
    'image':image,
    'title':title,
    'rate':rate,
    'sold':sold,
    'location':location,
    'price':price,
    'liked':liked,
      };

  static Products fromJson(Map<String, dynamic> json) => Products(
        image: json['image'],
        title: json['title'],
        rate: json['rate'],
        sold: json['sold'],
        location: json['location'],
        price: json['price'],
        liked: json['liked'],
      );
}
