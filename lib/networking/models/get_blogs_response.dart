class GetBlogsResponse {
    GetBlogsResponse({
        this.blogs,
        this.count,
    });

    List<Blog> blogs;
    int count;

    factory GetBlogsResponse.fromJson(Map<String, dynamic> json) => GetBlogsResponse(
        blogs: List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "blogs": List<dynamic>.from(blogs.map((x) => x.toJson())),
        "count": count,
    };
}

class Blog {
    Blog({
        this.authorId,
        this.author,
        this.blogContent,
        this.createdAt,
        this.blogId,
    });

    int authorId;
    String author;
    String blogContent;
    DateTime createdAt;
    int blogId;

    factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        authorId: json["author_id"],
        author: json["author"],
        blogContent: json["blog_content"],
        createdAt: DateTime.parse(json["created_at"]),
        blogId: json["blog_id"],
    );

    Map<String, dynamic> toJson() => {
        "author_id": authorId,
        "author": author,
        "blog_content": blogContent,
        "created_at": createdAt.toIso8601String(),
        "blog_id": blogId,
    };
}
