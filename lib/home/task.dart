import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isChecked;
  bool? isDeleted;

  Task({
    required this.title,
    this.isChecked,
    this.isDeleted,
  }) {
    isChecked = isChecked ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isChecked,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isChecked': isChecked,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isChecked: map['isChecked'] != null ? map['isChecked'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        isChecked,
        isDeleted,
      ];
}
