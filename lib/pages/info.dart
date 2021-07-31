// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        this.species,
        this.age,
        this.planet,
        this.profession,
        this.status,
        this.firstAppearance,
        this.picUrl,
        this.relatives,
        this.voicedBy,
        this.name,
    });

    String species;
    String age;
    String planet;
    String profession;
    Status status;
    String firstAppearance;
    String picUrl;
    String relatives;
    String voicedBy;
    String name;

    factory Welcome.fromJson(Map<String, dynamic> json) {
     return Welcome(
        species: json["Species"],
        age: json["Age"],
        planet: json["Planet"],
        profession: json["Profession"],
        status: statusValues.map[json["Status"]],
        firstAppearance: json["FirstAppearance"],
        picUrl: json["PicUrl"],
        relatives: json["Relatives"],
        voicedBy: json["VoicedBy"],
        name: json["Name"],
    );}

    Map<String, dynamic> toJson() => {
        "Species": species,
        "Age": age,
        "Planet": planet,
        "Profession": profession,
        "Status": statusValues.reverse[status],
        "FirstAppearance": firstAppearance,
        "PicUrl": picUrl,
        "Relatives": relatives,
        "VoicedBy": voicedBy,
        "Name": name,
    };
}

enum Status { ALIVE, REVIVED, UNKNOWN, ALIVE_GRA }

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Alive gra": Status.ALIVE_GRA,
    "Revived": Status.REVIVED,
    "Unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
