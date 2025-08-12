import 'dart:convert';

class CountryModel {
    Flags? flags;
    Name? name;
    String? cca2;

    CountryModel({
        this.flags,
        this.name,
        this.cca2,
    });

    CountryModel copyWith({
        Flags? flags,
        Name? name,
        String? cca2,
    }) => 
        CountryModel(
            flags: flags ?? this.flags,
            name: name ?? this.name,
            cca2: cca2 ?? this.cca2,
        );

    factory CountryModel.fromRawJson(String str) => CountryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        cca2: json["cca2"],
    );

    Map<String, dynamic> toJson() => {
        "flags": flags?.toJson(),
        "name": name?.toJson(),
        "cca2": cca2,
    };
}

class Flags {
    String? png;
    String? svg;
    String? alt;

    Flags({
        this.png,
        this.svg,
        this.alt,
    });

    Flags copyWith({
        String? png,
        String? svg,
        String? alt,
    }) => 
        Flags(
            png: png ?? this.png,
            svg: svg ?? this.svg,
            alt: alt ?? this.alt,
        );

    factory Flags.fromRawJson(String str) => Flags.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
    };
}

class Name {
    String? common;
    String? official;
    Map<String, NativeName>? nativeName;

    Name({
        this.common,
        this.official,
        this.nativeName,
    });

    Name copyWith({
        String? common,
        String? official,
        Map<String, NativeName>? nativeName,
    }) => 
        Name(
            common: common ?? this.common,
            official: official ?? this.official,
            nativeName: nativeName ?? this.nativeName,
        );

    factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]!).map((k, v) => MapEntry<String, NativeName>(k, NativeName.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class NativeName {
    String? official;
    String? common;

    NativeName({
        this.official,
        this.common,
    });

    NativeName copyWith({
        String? official,
        String? common,
    }) => 
        NativeName(
            official: official ?? this.official,
            common: common ?? this.common,
        );

    factory NativeName.fromRawJson(String str) => NativeName.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}
