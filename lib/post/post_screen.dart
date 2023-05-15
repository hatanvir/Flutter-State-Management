import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_flutter/di/service_locator.dart';
import 'package:riverpod_flutter/extensions/paddding_extension.dart';
import 'package:riverpod_flutter/post/post_bloc.dart';
import 'package:riverpod_flutter/post/post_event.dart';
import 'package:riverpod_flutter/post/post_state.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);
  PostBloc postBloc = serviceLocator.get<PostBloc>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (_) => postBloc..add(GetPostEvent()),
        child: BlocBuilder<PostBloc,PostState>(
          builder: (ctx,state){
            if(state is LoadingState){
              return const CircularProgressIndicator();
            }else if(state is ErrorState){
              return Text(state.msg);
            }else if(state is LoadedPostState){
              return ListView.separated(
                  itemBuilder: (ctx,i){
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300]
                        ),
                        padding: const EdgeInsets.all(10),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(state.postList[i].title??"",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        5.height,

                        Text(state.postList[i].body??"",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                    ],
                    ),
                    );
                  },
                  separatorBuilder: (ctx,i)=> 5.height,
                  itemCount: state.postList.length
              );
            }else{
              return 0.height;
            }
          },
        ),
      )
    );
  }
}
