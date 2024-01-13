import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(currentIndex: 0)){
    on<HomeEvent>((event, emit) {
      if (event is BottomNavigationItemClicked) {
        print(event.itemIndex);
        emit(HomeInitial(currentIndex: event.itemIndex));
      }
    });
  }
}
