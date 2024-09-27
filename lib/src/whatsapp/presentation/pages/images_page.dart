import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:snapkeep/src/core/widgets/loader.dart';
import 'package:snapkeep/src/whatsapp/presentation/bloc/status_bloc.dart';
import 'package:snapkeep/src/whatsapp/presentation/widgets/status_image.dart';

@RoutePage()
class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StatusBloc, StatusState>(
        listener: (context, state) {
          if (state is StatusLoadFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message,
                    style: TextStyle(
                      fontSize: 14.sp,
                    )),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingStatus) {
            return const Loader();
          }

          if (state is StatusLoadFailure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/errors/error.png'),
                Text(
                  state.message,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            );
          }

          if (state is StatusLoaded) {
            if (state.statuses.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/errors/empty.png'),
                  Text(
                    'No images found',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              );
            } else {
              return GridView.builder(
                padding: EdgeInsets.all(8.r),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.r,
                  mainAxisSpacing: 10.r,
                  childAspectRatio: 1,
                ),
                itemCount: state.statuses.length,
                itemBuilder: (context, index) {
                  final status = state.statuses[index];
                  return StatusImage(status: status);
                },
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
