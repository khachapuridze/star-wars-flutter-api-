class People {
  String? name;
  String? height;
  String? mass;
  String? hairColor;
  String? skinColor;
  String? eyeColor;
  String? birthYear;
  String? gender;
  String? homeworld;
  List<String>? films;
  List<String>? vehicles;
  List<String>? starships;
  String? created;
  String? edited;
  String? url;

  People(
      {required this.name,
      required this.height,
      required this.mass,
      required this.hairColor,
      required this.skinColor,
      required this.eyeColor,
      required this.birthYear,
      required this.gender,
      required this.homeworld,
      required this.films,
      required this.vehicles,
      required this.starships,
      required this.created,
      required this.edited,
      required this.url});

  People.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    films = json['films'].cast<String>();
    vehicles = json['vehicles'].cast<String>();
    starships = json['starships'].cast<String>();
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['height'] = this.height;
    data['mass'] = this.mass;
    data['hair_color'] = this.hairColor;
    data['skin_color'] = this.skinColor;
    data['eye_color'] = this.eyeColor;
    data['birth_year'] = this.birthYear;
    data['gender'] = this.gender;
    data['homeworld'] = this.homeworld;
    data['films'] = this.films;
    data['vehicles'] = this.vehicles;
    data['starships'] = this.starships;
    data['created'] = this.created;
    data['edited'] = this.edited;
    data['url'] = this.url;
    return data;
  }
}
