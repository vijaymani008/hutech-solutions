import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hutech_project/model/home_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
   on<HomeInitialFetchEvent>(homeInitialFetchEvent);
  }

  FutureOr<void> homeInitialFetchEvent(HomeInitialFetchEvent event, Emitter<PostState> emit) async {
    var client = http.Client();
    List<HomePostUiData> posts =[];
    try{
      var response = await client.get(
          Uri.parse(
              'https://jsonplaceholder.typicode.com/photos')
      );
      List result = jsonDecode(response.body);
      print(result);
      for(int i=0;i<result.length;i++){
        HomePostUiData post = HomePostUiData.fromMap(result[i] as Map<String,dynamic> );
        posts.add(post);
      }
      emit(HomeFetchingSuccessfulState(posts: posts));
    }
    catch(e){
      print(e.toString());
    }
  }

}
