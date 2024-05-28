part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}
abstract class HomeActionState extends PostState{}
class HomeFetchingSuccessfulState extends PostState{
  final List<HomePostUiData> posts;

  HomeFetchingSuccessfulState({required this.posts});
}
