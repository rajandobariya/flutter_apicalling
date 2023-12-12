class Post {
  int id;
  String image;

  Post({required this.id, required this.image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      image: json['image'],
    );
  }
}
