import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/listener_provider_counter/counter_cubit.dart';


class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocProvider(
              create: (context) => CounterCubit(),
              child: BlocListener<CounterCubit, CounterState>(
                listener: (context, state) {
                  if(state.wasIncremented == true){

                    var snackBar = const SnackBar(
                      // elevation: 0,
                      // behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("increment"),
                      duration: Duration(seconds: 2),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else {

                    var snackBar = const SnackBar(
                      // elevation: 0,
                      // behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("decrement"),
                      duration: Duration(seconds: 2),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },

                child: BlocBuilder<CounterCubit, CounterState>(
                  // builder: (context, count) => Center(child: Text('$count'))
                  builder: (context, state) {
                    return Column(
                      children: [
                        Center(child: Text(state.counterValue.toString())),

                        Button("Add", () {
                          context.read<CounterCubit>().increment();
                        }),
                        Button("sub", () {
                          // context.read<CounterCubit>().decrement();
                          BlocProvider.of<CounterCubit>(context).decrement();
                        }),

                      ],
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}


class Button extends StatelessWidget {
  final String text;
  final VoidCallback callback; // Notice the variable type

  const Button(this.text, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: callback, // Simply put the function name here, DON'T use ()
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),)),
      ),

    );
  }
}




