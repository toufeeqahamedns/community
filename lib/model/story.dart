class Story {
  final String id;
  final String heading;
  final String imageUrl;  

  const Story ({
    this.id,
    this.heading,
    this.imageUrl,
  });

  Story.fromMap(Map<String, dynamic> data, String id)
    : this(
      id: id,
      heading: data['heading'],
      imageUrl: data['imageUrl']
    );
}

