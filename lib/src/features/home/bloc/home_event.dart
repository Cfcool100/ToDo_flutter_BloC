part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class BottomNavigationItemClicked extends HomeEvent {
  final int itemIndex;

  BottomNavigationItemClicked({required this.itemIndex});
}
