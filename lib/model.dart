import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String id;
  String postHeader;
  String postBody;

  Post({
    this.id,
    this.postHeader,
    this.postBody,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        postHeader: json["post_header"],
        postBody: json["post_body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_header": postHeader,
        "post_body": postBody,
      };
}
