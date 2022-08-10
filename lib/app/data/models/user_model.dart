class UserModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;
  Support support;

  UserModel({
    this.page = 0,
    this.perPage = 0,
    this.total = 0,
    this.totalPages = 0,
    this.data = const [],
    required this.support,
  });

  static UserModel fromJson(json) {
    return UserModel(
      page: json['page'] ?? 0,
      perPage: json['per_page'] ?? 0,
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      support: json['support'] != null
          ? Support.fromJson(json['support'])
          : Support(),
      data: json['data'] == null
          ? List<Data>.empty()
          : List<Data>.from(json['data'].map((i) => Data.fromJson(i))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    data['support'] = this.support.toJson();
    return data;
  }
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({
    this.id = 0,
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.avatar = "",
  });

  static Data fromJson(json) {
    return Data(
      id: json['id'] ?? 0,
      email: json['email'] ?? "",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      avatar: json['avatar'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String url;
  String text;

  Support({this.url = "", this.text = ""});

  static Support fromJson(json) {
    return Support(
      url: json['url'] ?? "",
      text: json['text'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
