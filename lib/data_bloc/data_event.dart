import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object?> get props => [];
}

class RequestSendDataEvent extends DataEvent {
  final String text;

  const RequestSendDataEvent(this.text);

  @override
  List<Object?> get props => [text];
}
