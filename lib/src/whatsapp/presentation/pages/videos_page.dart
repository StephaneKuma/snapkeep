import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snapkeep/src/core/widgets/loader.dart';
import 'package:snapkeep/src/whatsapp/presentation/bloc/status_bloc.dart';
import 'package:snapkeep/src/whatsapp/presentation/widgets/status_video.dart';

@RoutePage()
class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StatusBloc, StatusState>(
        listener: (context, state) {
          if (state is StatusLoadFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingStatus) {
            return const Loader();
          }

          if (state is StatusLoadFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is StatusLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: state.statuses.length,
              itemBuilder: (context, index) {
                final status = state.statuses[index];
                return StatusVideo(status: status);
              },
            );
          }

          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
