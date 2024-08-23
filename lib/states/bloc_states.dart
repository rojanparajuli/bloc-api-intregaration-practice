import 'package:api_testing/model/api_model.dart';
import 'package:equatable/equatable.dart';

abstract class ApiState extends Equatable {
  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
  final ApiModel apiModel;

  ApiLoaded({required this.apiModel});

  @override
  List<Object> get props => [apiModel];
}

class ApiError extends ApiState {
  final String message;

  ApiError({required this.message});

  @override
  List<Object> get props => [message];
}
