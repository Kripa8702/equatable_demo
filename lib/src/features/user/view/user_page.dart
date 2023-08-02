import 'package:equatable_demo/src/features/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      body: isLoading?
      const Center(
        child: CircularProgressIndicator(),
      )
          :
          ListView.builder(
            itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(data[index].name??""),
                );
              }
          )
    );

  }
}
