class Tasks {
  final String title;
  final String location;
  final String description;

  Tasks(this.title, this.location, this.description);

  Tasks.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        location = json['location'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'location': location,
        'description': description,
      };
}
