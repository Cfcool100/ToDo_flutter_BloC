import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
  
    // on<TaskEvent>(taskEvent);
  }

  // FutureOr<void> taskEvent(TaskEvent event, Emitter<TaskState> emit) {
  // }
}
