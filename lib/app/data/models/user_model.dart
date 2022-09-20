class User {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? displayName;
  String? bio;
  String? gender;
  int? karma;
  bool? verified;
  bool? online;
  String? displayPicture;
  bool? master;
  bool? mod;
  String? username;
  Flair? flair;
  Badge? badge;
  bool? temp;
  dynamic settings;
  bool? gold;
  List<Interest>? interests;
  List<Badge>? badges;

  User(
      {this.id,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.displayName,
      this.bio,
      this.gender,
      this.karma,
      this.verified,
      this.online,
      this.displayPicture,
      this.master,
      this.mod,
      this.username,
      this.flair,
      this.badge,
      this.temp,
      this.settings,
      this.gold,
      this.interests,
      this.badges});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    displayName = json['display_name'];
    bio = json['bio'];
    gender = json['gender'];
    karma = json['karma'];
    verified = json['verified'];
    online = json['online'];
    displayPicture = json['display_picture'];
    master = json['master'];
    mod = json['mod'];
    username = json['username'];
    flair = json['flair'] != null ? Flair?.fromJson(json['flair']) : null;
    badge = json['badge'] != null ? Badge?.fromJson(json['badge']) : null;
    temp = json['temp'];
    settings = json['settings'];
    gold = json['gold'];
    if (json['interests'] != null) {
      interests = <Interest>[];
      json['interests'].forEach((v) {
        interests?.add(Interest.fromJson(v));
      });
    }
    if (json['badges'] != null) {
      badges = <Badge>[];
      json['badges'].forEach((v) {
        badges?.add(Badge.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['display_name'] = displayName;
    data['bio'] = bio;
    data['gender'] = gender;
    data['karma'] = karma;
    data['verified'] = verified;
    data['online'] = online;
    data['display_picture'] = displayPicture;
    data['master'] = master;
    data['mod'] = mod;
    data['username'] = username;
    if (flair != null) {
      data['flair'] = flair?.toJson();
    }
    if (badge != null) {
      data['badge'] = badge?.toJson();
    }
    data['temp'] = temp;
    data['settings'] = settings;
    data['gold'] = gold;
    if (interests != null) {
      data['interests'] = interests?.map((v) => v.toJson()).toList();
    }
    if (badges != null) {
      data['badges'] = badges?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Flair {
  String? color;

  Flair({this.color});

  Flair.fromJson(Map<String, dynamic> json) {
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    return data;
  }
}

class Badge {
  int? id;
  dynamic data;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? description;

  Badge(
      {this.id,
      this.data,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.description});

  Badge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = data;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['description'] = description;
    return data;
  }
}

class Interest {
  int? id;
  dynamic data;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? description;

  Interest(
      {this.id,
      this.data,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.description});

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = data;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['description'] = description;
    return data;
  }
}
