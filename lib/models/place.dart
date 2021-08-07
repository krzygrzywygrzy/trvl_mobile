class Place {
  const Place({
    required this.name,
    required this.description,
    this.photo,
  });

  final String name;
  final String description;
  final String? photo;

  //TODO: make formJson and toJson methods
}
