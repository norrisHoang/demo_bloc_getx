import 'package:demo_getx_bloc/data_bloc/data_event.dart';
import 'package:demo_getx_bloc/data_bloc/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, DataSate> {
  DataBloc() : super(const DataInitial()) {
    on<RequestSendDataEvent>((event, emit) => _handleGetPosts(event, emit));
  }

  _handleGetPosts(RequestSendDataEvent event, Emitter emit) {
    emit(const DataLoading());
    try {
      emit(DataLoaded(event.text));
    } catch (e) {
      emit(DataError(message: e.toString()));
    }
  }
}
