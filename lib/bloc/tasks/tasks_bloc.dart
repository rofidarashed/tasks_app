import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksInitial('vvfd')) {
    on<TasksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
