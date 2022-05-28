import 'dart:developer';

import '../../networking/ApiProvider/ApiProvider.dart';
import '../../networking/models/get_blogs_response.dart';

class BlogRepository {
  ApiProvider _provider = ApiProvider();
  Future<GetBlogsResponse> getBlogs() async {
    final response = await _provider.get('blogs');
    return GetBlogsResponse.fromJson(response);
  }
    Future addBlog(Map<String,String> blogBody) async {
    final response = await _provider.post('add_blog',blogBody).then((value){
      log(value.toString());
    });
    // return GetBlogsResponse.fromJson(response);
  }
}
