class Reward {
  Reward({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  late final String id;
  late final String name;
  late final int price;
  late final String imageUrl;

  Reward.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['imageUrl'] = imageUrl;
    return _data;
  }
}
