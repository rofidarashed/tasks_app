part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  final String taskValue;
  const TasksState(this.taskValue);

  @override
  List<Object> get props => [taskValue];
}

final class TasksInitial extends TasksState {
  const TasksInitial(super.taskValue);
}
