class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? uuid;
  int? status;
  int? emailVerified;
  int? merchantId;
  int? shopId;
  String? fullName;
  String? address;
  String? phoneNumber;
  String? photo;
  String? gender;
  String? birthdate;
  String? nationality;
  bool? isTourist;
  String? phone;
  String? language;
  int? totalActiveDeals;
  int? totalFavorites;
  int? totalSave;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.uuid,
    this.status,
    this.emailVerified,
    this.merchantId,
    this.shopId,
    this.fullName,
    this.address,
    this.phoneNumber,
    this.photo,
    this.gender,
    this.birthdate,
    this.nationality,
    this.isTourist,
    this.phone,
    this.language,
    this.totalActiveDeals,
    this.totalFavorites,
    this.totalSave,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    uuid = json['uuid'];
    status = json['status'];
    emailVerified = json['email_verified'];
    merchantId = json['merchant_id'];
    shopId = json['shop_id'];
    fullName = json['full_name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    nationality = json['nationality'];
    isTourist = json['is_tourist'];
    phone = json['phone'];
    language = json['language'];
    totalActiveDeals = json['total_active_deals'];
    totalFavorites = json['total_favorites'];
    totalSave = json['total_save'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['uuid'] = uuid;
    data['status'] = status;
    data['email_verified'] = emailVerified;
    data['merchant_id'] = merchantId;
    data['shop_id'] = shopId;
    data['full_name'] = fullName;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['photo'] = photo;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['nationality'] = nationality;
    data['is_tourist'] = isTourist;
    data['phone'] = phone;
    data['language'] = language;
    data['total_active_deals'] = totalActiveDeals;
    data['total_favorites'] = totalFavorites;
    data['total_save'] = totalSave;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
