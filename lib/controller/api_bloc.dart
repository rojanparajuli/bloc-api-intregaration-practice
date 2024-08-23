import 'package:api_testing/event/api_bloc.dart';
import 'package:api_testing/service/api_service.dart';
import 'package:api_testing/states/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;

  ApiBloc({required this.apiService}) : super(ApiInitial()) {
    on<FetchApiData>((event, emit) async {
      emit(ApiLoading());
      try {
        final apiModel = await apiService.fetchData();
        emit(ApiLoaded(apiModel: apiModel));
      } catch (e) {
        emit(ApiError(message: e.toString()));
      }
    });
  }
}
