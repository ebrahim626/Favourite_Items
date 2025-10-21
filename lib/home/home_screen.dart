import 'package:favourite_items/provider/future_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/favourite provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final favourite = ref.watch(favouriteProvider);
    final future = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MoboData')),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favourite(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: 'All', child: Text('All')),
                PopupMenuItem(value: 'Favourite', child: Text('Favourite')),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(favouriteProvider.notifier).searchItem(value);
            },
          ),
          Expanded(
            child: future.when(
              skipLoadingOnReload: false,
              data: (value) {
                return ListView(
                  children: [
                    // Section 1: favourite items
                    ...favourite.filteredItem.map((currentItem) => ListTile(
                      title: Text(currentItem.name),
                      trailing: Icon(
                        currentItem.favourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    )),

                    const Divider(thickness: 1),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Future Data',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),

                    // Section 2: future data
                    ...value.map((v) => ListTile(title: Text(v.toString()))),
                  ],
                );
              },
              error: (error, stack) => Center(child: Text(error.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ref.read(favouriteProvider.notifier).addItem();
          await Future.delayed(Duration(milliseconds: 100));
          ref.refresh(futureProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
