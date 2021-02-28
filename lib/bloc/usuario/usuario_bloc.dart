import 'package:estados/models/usuario.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield state.copyWith(user: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(user: state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      yield state.copyWith(
          user: state.usuario.copyWith(
              profesiones: [...state.usuario.profesiones, event.profesion]));
    } else if (event is EliminarUsuario) {
      yield state.estadoInicial();
    }
  }
}
