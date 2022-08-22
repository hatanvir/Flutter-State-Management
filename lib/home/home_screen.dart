import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/home/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake post list'),
      ),
      body: Center(
        child: Consumer(
          builder: (ctx,ref,child){
            final postListValue = ref.watch(postListProvider);
            return postListValue.when(
                data: (data)=>ListView.separated(
                    itemBuilder: (ctx,i){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey
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
                            const SizedBox(height: 5,),

                            Text(data[i].body??"",
                              style: const TextStyle(
                                  fontSize: 16,
                              ),
                            ),
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
      ),
    );
  }
}
