import 'dart:core';

class Puppies {
  String? id;
  String? url;
  List<Breeds>? breeds;
  int? width;
  int? height;

  Puppies({this.id, this.url, this.breeds, this.width, this.height});

  Puppies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    if (json['breeds'] != null) {
      breeds = [];
      json['breeds'].forEach((v) {
        breeds?.add(Breeds.fromJson(v));
      });
    }
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    if (breeds != null) {
      data['breeds'] = breeds?.map((v) => v.toJson()).toList();
    }
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Breeds {
  Weight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? catFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? bidability;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;

  Breeds(
      {this.weight,
      this.id,
      this.name,
      this.cfaUrl,
      this.vetstreetUrl,
      this.vcahospitalsUrl,
      this.temperament,
      this.origin,
      this.countryCodes,
      this.countryCode,
      this.description,
      this.lifeSpan,
      this.indoor,
      this.lap,
      this.adaptability,
      this.affectionLevel,
      this.childFriendly,
      this.catFriendly,
      this.dogFriendly,
      this.energyLevel,
      this.grooming,
      this.healthIssues,
      this.intelligence,
      this.sheddingLevel,
      this.socialNeeds,
      this.strangerFriendly,
      this.vocalisation,
      this.bidability,
      this.experimental,
      this.hairless,
      this.natural,
      this.rare,
      this.rex,
      this.suppressedTail,
      this.shortLegs,
      this.wikipediaUrl,
      this.hypoallergenic,
      this.referenceImageId});

  Breeds.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    cfaUrl = json['cfa_url'];
    vetstreetUrl = json['vetstreet_url'];
    vcahospitalsUrl = json['vcahospitals_url'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    description = json['description'];
    lifeSpan = json['life_span'];
    indoor = json['indoor'];
    lap = json['lap'];
    adaptability = json['adaptability'];
    affectionLevel = json['affection_level'];
    childFriendly = json['child_friendly'];
    catFriendly = json['cat_friendly'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    grooming = json['grooming'];
    healthIssues = json['health_issues'];
    intelligence = json['intelligence'];
    sheddingLevel = json['shedding_level'];
    socialNeeds = json['social_needs'];
    strangerFriendly = json['stranger_friendly'];
    vocalisation = json['vocalisation'];
    bidability = json['bidability'];
    experimental = json['experimental'];
    hairless = json['hairless'];
    natural = json['natural'];
    rare = json['rare'];
    rex = json['rex'];
    suppressedTail = json['suppressed_tail'];
    shortLegs = json['short_legs'];
    wikipediaUrl = json['wikipedia_url'];
    hypoallergenic = json['hypoallergenic'];
    referenceImageId = json['reference_image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weight != null) {
      data['weight'] = weight?.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['cfa_url'] = cfaUrl;
    data['vetstreet_url'] = vetstreetUrl;
    data['vcahospitals_url'] = vcahospitalsUrl;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['country_codes'] = countryCodes;
    data['country_code'] = countryCode;
    data['description'] = description;
    data['life_span'] = lifeSpan;
    data['indoor'] = indoor;
    data['lap'] = lap;
    data['adaptability'] = adaptability;
    data['affection_level'] = affectionLevel;
    data['child_friendly'] = childFriendly;
    data['cat_friendly'] = catFriendly;
    data['dog_friendly'] = dogFriendly;
    data['energy_level'] = energyLevel;
    data['grooming'] = grooming;
    data['health_issues'] = healthIssues;
    data['int?elligence'] = intelligence;
    data['shedding_level'] = sheddingLevel;
    data['social_needs'] = socialNeeds;
    data['stranger_friendly'] = strangerFriendly;
    data['vocalisation'] = vocalisation;
    data['bidability'] = bidability;
    data['experimental'] = experimental;
    data['hairless'] = hairless;
    data['natural'] = natural;
    data['rare'] = rare;
    data['rex'] = rex;
    data['suppressed_tail'] = suppressedTail;
    data['short_legs'] = shortLegs;
    data['wikipedia_url'] = wikipediaUrl;
    data['hypoallergenic'] = hypoallergenic;
    data['reference_image_id'] = referenceImageId;
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

  // Future<Post?>? post;
  // Future<List<Puppies>>? puppieList;
  // ApiService current = ApiService(puppies: []);
  // void clickGetButton() {
  //   setState(() {
  //     puppieList = current.fetchPost();
  //   });
  // }

  
  // FutureBuilder<Post?>(
  //     future: post,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const CircularProgressIndicator();
  //       } else if (snapshot.connectionState ==
  //           ConnectionState.none) {
  //         return Container();
  //       } else {
  //         if (snapshot.hasData) {
  //           return buildDataWidget(context, snapshot);
  //         } else if (snapshot.hasError) {
  //           return Text("{$snapshot.error}");
  //           // return Text("Erreur");
  //         } else {
  //           return Container();
  //         }
  //       }
  //     }),