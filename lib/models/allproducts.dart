class Productmodel {
  final int id;
  final dynamic price;
  final String title;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  Productmodel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Productmodel.fromJson(Map<String, dynamic> jsonData) {
    return Productmodel(
      id: jsonData['id'],
      title: jsonData['title'],
      category: jsonData['category'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'],
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : RatingModel(count: 0, rating: 0.0), // Handle null rating gracefully
    );
  }
}

class RatingModel {
  final double rating;
  final int count;

  RatingModel({
    required this.count,
    required this.rating,
  });

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      count: jsonData['count'],
      rating: (jsonData['rate'] as num).toDouble(),
    );
  }
}
