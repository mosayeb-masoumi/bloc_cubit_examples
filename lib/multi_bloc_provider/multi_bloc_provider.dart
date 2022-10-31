import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/multi_bloc_provider/int_cubit.dart';
import 'package:getx_project/multi_bloc_provider/string_cubit.dart';

class MultiBlocProviderPage extends StatefulWidget {
  const MultiBlocProviderPage({Key? key}) : super(key: key);

  @override
  State<MultiBlocProviderPage> createState() => _MultiBlocProviderPageState();
}

class _MultiBlocProviderPageState extends State<MultiBlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("multi provider"),
      ),
      body: Center(
          child: MultiBlocProvider(
              providers: [
            //first provider
            BlocProvider(create: (context) => IntCubit()),
            //second provider
            BlocProvider(create: (context) => StringCubit(),),

          ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //first builder
                  BlocConsumer<IntCubit, IntState>(
                    listener: (context, state) {
                      // if (state is GetDataLoaded) {
                      //   // start new screen for example
                      // }
                      if (state.currentValue == 1) {
                        var a = 1;
                      } else {
                        var a = 6;
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Text(state.currentValue.toString()),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<IntCubit>(context).increment();
                              },
                              child: Text("increase int")),
                        ],
                      );
                    },
                  ),


                  const SizedBox(
                    height: 50,
                  ),

                  //second b builder
                  BlocConsumer<StringCubit, StringState>(
                    listener: (context, state) {
                      // if (state is GetDataLoaded) {
                      //   // start new screen for example
                      // }

                      if (state.title == "titley") {
                        var a = 1;
                      } else {
                        var a = 6;
                      }

                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Text(state.title),
                          ElevatedButton(
                              onPressed: () {
                                context.read<StringCubit>().addCharacter();
                              },
                              child: Text("add character")),
                        ],
                      );
                    },
                  )
                ],
              ))),
    );
  }
}
