import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String text;

  const Note(this.id, this.text);

  @override
  List<Object> get props => [id, text];
}