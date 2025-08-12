class ListResponse<T> {
  bool? status;
  String? message;
  List<T>? data;
  Pagination? pagination;

  ListResponse({this.status, this.message, this.data, this.pagination});

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    var data = <T>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(create(v));
      });
    }

    return ListResponse<T>(
      status: json["status"],
      message: json["message"],
      data: data,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }
}

class Pagination {
  int? page;
  int? totalData;
  int? pageSize;
  int? totalPages;

  Pagination({this.page, this.totalData, this.pageSize, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalData = json['total_data'];
    pageSize = json['page_size'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['total_data'] = totalData;
    data['page_size'] = pageSize;
    data['total_pages'] = totalPages;
    return data;
  }
}
