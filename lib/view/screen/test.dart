import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_translate/state%20management/bloc/Check%20connection/check_connection_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckConnectionCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
          builder: (context, state) {
            if (state is CheckConnectionHasInternet) {
              return const Center(
                  child: Text('You are connected to the internet.'));
            } else if (state is CheckConnectionNoInternet) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No internet connection.'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // استدعاء الدالة المخصصة للتحقق من الاتصال
                        context
                            .read<CheckConnectionCubit>()
                            .checkInitialConnectivity();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
