import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
  dynamic preference;
  Pagination? pagination;
  List<Datum>? data;
  Info? info;
  Config? config;

  ApiModel({
    this.preference,
    this.pagination,
    this.data,
    this.info,
    this.config,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        preference: json["preference"],
        pagination: json["pagination"] != null ? Pagination.fromJson(json["pagination"]) : null,
        data: json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))) : null,
        info: json["info"] != null ? Info.fromJson(json["info"]) : null,
        config: json["config"] != null ? Config.fromJson(json["config"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "preference": preference,
        "pagination": pagination?.toJson(),
        "data": data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
        "info": info?.toJson(),
        "config": config?.toJson(),
      };
}

class Config {
  String? iiifUrl;
  String? websiteUrl;

  Config({
    this.iiifUrl,
    this.websiteUrl,
  });

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        iiifUrl: json["iiif_url"],
        websiteUrl: json["website_url"],
      );

  Map<String, dynamic> toJson() => {
        "iiif_url": iiifUrl,
        "website_url": websiteUrl,
      };
}

class Datum {
  double? score;
  Thumbnail? thumbnail;
  String? apiModel;
  bool? isBoosted;
  String? apiLink;
  int? id;
  String? title;
  DateTime? timestamp;

  Datum({
    this.score,
    this.thumbnail,
    this.apiModel,
    this.isBoosted,
    this.apiLink,
    this.id,
    this.title,
    this.timestamp,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        score: json["_score"]?.toDouble(),
        thumbnail: json["thumbnail"] != null ? Thumbnail.fromJson(json["thumbnail"]) : null,
        apiModel: json["api_model"],
        isBoosted: json["is_boosted"],
        apiLink: json["api_link"],
        id: json["id"],
        title: json["title"],
        timestamp: json["timestamp"] != null ? DateTime.parse(json["timestamp"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "_score": score,
        "thumbnail": thumbnail?.toJson(),
        "api_model": apiModel,
        "is_boosted": isBoosted,
        "api_link": apiLink,
        "id": id,
        "title": title,
        "timestamp": timestamp?.toIso8601String(),
      };
}

class Thumbnail {
  String? altText;
  int? width;
  String? lqip;
  int? height;

  Thumbnail({
    this.altText,
    this.width,
    this.lqip,
    this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        altText: json["alt_text"],
        width: json["width"],
        lqip: json["lqip"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "alt_text": altText,
        "width": width,
        "lqip": lqip,
        "height": height,
      };
}

class Info {
  String? licenseText;
  List<String>? licenseLinks;
  String? version;

  Info({
    this.licenseText,
    this.licenseLinks,
    this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        licenseText: json["license_text"],
        licenseLinks: json["license_links"] != null
            ? List<String>.from(json["license_links"].map((x) => x))
            : null,
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "license_text": licenseText,
        "license_links": licenseLinks != null ? List<dynamic>.from(licenseLinks!.map((x) => x)) : null,
        "version": version,
      };
}

class Pagination {
  int? total;
  int? limit;
  int? offset;
  int? totalPages;
  int? currentPage;

  Pagination({
    this.total,
    this.limit,
    this.offset,
    this.totalPages,
    this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "offset": offset,
        "total_pages": totalPages,
        "current_page": currentPage,
      };
}
