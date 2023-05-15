import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_flutter/di/service_locator.dart';
import 'package:riverpod_flutter/extensions/paddding_extension.dart';
import 'package:riverpod_flutter/module/photo/photo_bloc.dart';
import 'package:riverpod_flutter/module/photo/photo_event.dart';
import 'package:riverpod_flutter/module/photo/photo_state.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<PhotoBloc>()..add(GetPhotoEvent()),
      child: Center(
        child: BlocBuilder<PhotoBloc,PhotoState>(
          builder: (ctx,state){
//            ctx.read<PhotoBloc>().add(GetPhotoEvent());

            if(state is LoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is ErrorState){
              return Center(child: Text(state.msg.toString()),);
            }else if(state is PhotoLoadedState){
              return ListView.separated(
                  itemBuilder: (ctx,i){
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300]
                      ),
                      padding: const EdgeInsets.all(10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Image.network(state.photos[i].thumbnailUrl??'',
                            errorBuilder: (ctx,b,s)=>const Icon((Icons.error_outline)),height: 100,width: 100,),

                          10.width,

                          Expanded(
                            child: Text(state.photos[i].title??"",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx,i)=> 5.height,
                  itemCount: state.photos.length
              );
            }
            return 0.height;
          },
        )
      ),
    );
  }
}
