import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fd_event.dart';
part 'fd_state.dart';
part 'fd_bloc.freezed.dart';

class FdBloc extends Bloc<FdEvent, FdState> {
  FdBloc() : super(_Initial()) {
    on<FdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
