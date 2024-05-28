import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hutech_project/pages/home/bloc/post_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text("Home Screen"),),
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
              return GridView.builder(
                  itemCount: successState.posts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context,index){
                    return Card(
                      child: GridTile(
                        child: Image.network(successState.posts[index].thumbnailUrl)
                        //child: Text(successState.posts[index].url),
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
