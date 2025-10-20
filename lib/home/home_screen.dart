import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/favourite provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final favourite = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('MoboData'))),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favourite.favouriteItem.length,
              itemBuilder: (context, index) {
                final currentItem = favourite.favouriteItem[index];
                return ListTile(
                  title: Text(currentItem.name),
                  trailing: currentItem.favourite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),),
    );
  }
}
