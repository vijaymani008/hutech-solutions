import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hutech_project/pages/home/bloc/post_bloc.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PostBloc postsBloc = PostBloc();

  @override
  void initState() {
    postsBloc.add(HomeInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Category Screen"),),
     body: BlocConsumer<PostBloc, PostState>(
        bloc: postsBloc,
        listenWhen: (previous,current)=>current is HomeActionState,
        buildWhen: (previous, current)=> current is !HomeActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case HomeFetchingSuccessfulState:
              final successState = state as HomeFetchingSuccessfulState;
              return ListView.builder(
                  itemCount: successState.posts.length,

                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(

                          padding: EdgeInsets.all(8),
                          child: Text(successState.posts[index].title),
                        ),
                      ),
                    );
                  }
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
