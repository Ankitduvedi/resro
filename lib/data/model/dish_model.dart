class Dish {
  Dish({
    required this.images,
    required this.description,
    required this.name,
    required this.createdAt,
    required this.id,
    required this.cookingTime,
    required this.quantity,
    required this.discount,
    required this.ratings,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.tags,
  });

  late List<String> images;
  late String description;
  late String name;
  late String createdAt;
  late String id;
  late String price;
  late String cookingTime;
  late String quantity;
  late String discount;
  late String ratings;
  late String category;
  late String subCategory;
  late List<String> tags;

  // Updated fromJson method to include type conversion for lists
  Dish.fromJson(Map<String, dynamic> json) {
    images = List<String>.from(json['images'] ?? []);
    description = json['description'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? '';
    cookingTime = json['cookingTime'] ?? '';
    quantity = json['quantity'] ?? '';
    discount = json['discount'] ?? '';
    ratings = json['ratings'] ?? '';
    price = json['price'] ?? '';
    category = json['category'] ?? '';
    tags = List<String>.from(json['tags'] ?? []);
    subCategory = json['subCategory'] ?? "";
  }

  // Updated toJson method to include the new field
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['images'] = images;
    data['description'] = description;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['cookingTime'] = cookingTime;
    data['quantity'] = quantity;
    data['discount'] = discount;
    data['ratings'] = ratings;
    data['price'] = price;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['tags'] = tags;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'description': description,
      'name': name,
      'createdAt': createdAt,
      'id': id,
      'cookingTime': cookingTime,
      'quantity': quantity,
      'discount': discount,
      'ratings': ratings,
      'price': price,
      'tags': tags,
      'category': category,
      'subCategory': subCategory,
    };
  }

  factory Dish.empty() {
    return Dish(
      tags: [],
      images: [],
      description: 'Hey everyone',
      name: '',
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
      id: '',
      cookingTime: '',
      quantity: '',
      discount: '',
      ratings: '',
      price: '',
      category: '',
      subCategory: "",
    );
  }

  Dish copyWith({
    List<String>? images,
    String? description,
    String? name,
    String? createdAt,
    String? id,
    String? cookingTime,
    String? quantity,
    String? discount,
    String? ratings,
    String? price,
    String? category,
    String? subCategory,
    List<String>? tags,
  }) {
    return Dish(
      images: images ?? this.images,
      description: description ?? this.description,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      cookingTime: cookingTime ?? this.cookingTime,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
      ratings: ratings ?? this.ratings,
      price: price ?? this.price,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      tags: tags ?? this.tags,
    );
  }
}
