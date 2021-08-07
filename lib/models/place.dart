class Place {
  const Place({
    required this.name,
    required this.description,
    this.photo,
    required this.price,
  });

  final String name;
  final String description;
  final String? photo;
  final int price;

  //TODO: make formJson and toJson methods
}
