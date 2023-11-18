import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/home/presentation/bloc/home_bloc.dart';
import 'package:untitled2/injection_container.dart' as di;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HomeBloc>()..add(HomeGetArticlesEvent()),
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Text(state.message);
                } else if (state is HomeLoadingState) {
                  return const LinearProgressIndicator();
                } else if (state is HomeLoadedState) {
                  final articles = state.articles;
                  return ListView.separated(
                    itemCount: articles.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.black),
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          articles[index].title ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(articles[index].publishedAt ?? ''),
                      ],
                    ),
                  );
                } else {
                  return const Text('Unexpected State');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
