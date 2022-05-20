import 'package:equatable/equatable.dart';

abstract class DataSate extends Equatable {
  const DataSate();

  @override
  List<Object?> get props => [];
}

class DataInitial extends DataSate {
  const DataInitial();
}

class DataLoading extends DataSate {
  const DataLoading();
}

class DataLoaded extends DataSate {
  final String text;

  const DataLoaded(this.text);

  @override
  List<Object?> get props => [];
}

class DataError extends DataSate {
  final String message;

  const DataError({required this.message});

  @override
  List<Object?> get props => [message];
}
