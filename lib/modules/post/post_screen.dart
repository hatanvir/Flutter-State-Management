import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/extensions/paddding_extension.dart';
import 'package:riverpod_flutter/modules/post/post_provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
          builder: (ctx,ref,child){
            final postListValue = ref.watch(postListProvider);
            return postListValue.when(
                data: (data)=>ListView.separated(
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
                            Text(data[i].title??"",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            5.height,

                            Text(data[i].body??"",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),

                           /* Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green
                                ),
                              ),
                              child: Text('testjghjghjghj'),
                            )*/
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (ctx,i)=> 5.height,
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
