class Breeds {
  Weight? weight;
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? lifeSpan;
  String? wikipediaUrl;

  Breeds(
      {this.weight,
      this.id,
      this.name,
      this.temperament,
      this.origin,
      this.countryCodes,
      this.countryCode,
      this.lifeSpan,
      this.wikipediaUrl});

  Breeds.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    lifeSpan = json['life_span'];
    wikipediaUrl = json['wikipedia_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['country_codes'] = countryCodes;
    data['country_code'] = countryCode;
    data['life_span'] = lifeSpan;
    data['wikipedia_url'] = wikipediaUrl;
    return data;
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imperial'] = imperial;
    data['metric'] = metric;
    return data;
  }
}
