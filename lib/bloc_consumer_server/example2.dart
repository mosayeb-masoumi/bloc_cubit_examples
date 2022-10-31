import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/bloc_consumer_server/get_data_cubit.dart';
import 'package:getx_project/bloc_consumer_server/getdata_repository.dart';

class GetDataFromServer extends StatefulWidget {
  const GetDataFromServer({Key? key}) : super(key: key);

  @override
  State<GetDataFromServer> createState() => _GetDataFromServerState();
}

class _GetDataFromServerState extends State<GetDataFromServer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("server getting data"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.grey,
          child: BlocProvider(
            create: (context) => GetDataCubit(GetDataRepository()),
            child: BlocConsumer<GetDataCubit, GetDataState>(
              listener: (context, state) {
                if (state is GetDataLoaded) {
                  // start new screen for example
                }
              },
              builder: (context, state) {
                if (state is GetDataLoading) {
                  return buildWidget(context, "loading", "");
                } else if (state is GetDataLoaded) {
                  return buildWidget(context, "loaded", state.strResult);
                } else if (state is GetDataError) {
                  return buildWidget(context, "error", state.message);
                } else {
                  // means StudentListInitial
                  return buildWidget(context, "initial", "");
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWidget(BuildContext context, String type, String strResult) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              final cubit = BlocProvider.of<GetDataCubit>(context);
              cubit.getData(0);
            },
            child: Text("getData")),
        type == "loading"
            ? const CircularProgressIndicator(
                color: Colors.red,
              )
            :  type == "error"? Text(strResult) : Text(
                strResult,
                style: TextStyle(color: Colors.black, fontSize: 25),
              )
      ],
    );
  }
}
