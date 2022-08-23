import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/photo/photo_provider.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
          builder: (ctx,ref,child){
            final postListValue = ref.watch(photoListProvider);
            return postListValue.when(
                data: (data)=>ListView.separated(
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

                            Image.network(data[i].thumbnailUrl??'',
                                errorBuilder: (ctx,b,s)=>const Icon((Icons.error_outline)),height: 100,width: 100,),

                            const SizedBox(width: 10,),

                            Expanded(
                              child: Text(data[i].title??"",
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
                    separatorBuilder: (ctx,i)=>const SizedBox(height: 5,),
                    itemCount: data.length
                ),
                error: (err,st)=> Text(err.toString()),
                loading: ()=>const CircularProgressIndicator()
            );
          }
      ),
    );
  }
}
