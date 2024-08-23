import 'package:api_testing/controller/api_bloc.dart';
import 'package:api_testing/event/api_bloc.dart';
import 'package:api_testing/service/api_service.dart';
import 'package:api_testing/states/bloc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data'),
      ),
      body: BlocProvider(
        create: (context) => ApiBloc(apiService: ApiService())
          ..add(FetchApiData()),
        child: BlocBuilder<ApiBloc, ApiState>(
          builder: (context, state) {
            if (state is ApiInitial) {
              return const Center(child: Text('Please wait...'));
            } else if (state is ApiLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ApiLoaded) {
              return ListView.builder(
                itemCount: state.apiModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = state.apiModel.data![index];
                  return ListTile(
                    title: Text(item.title ?? 'No Title'),
                    // subtitle: item.thumbnail != null
                    //     ? Image.network(item.thumbnail!.lqip ?? '')
                    //     : null,
                    trailing: item.timestamp != null
                        ? Text(item.timestamp!.toLocal().toString())
                        : null,
                  );
                },
              );
            } else if (state is ApiError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
