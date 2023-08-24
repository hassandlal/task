import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_five/posts_module/cubit/states.dart';

import '../../modles/post_model.dart';
import '../../shared/componenets/constants.dart';
import '../../shared/network/remote/dio_helper.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsInitialState());

  static PostsCubit get(context) => BlocProvider.of(context);
  PostModel? postModel;
  List<dynamic> Posts = [];

  void getPostsData() {
    emit(PostsLoadingInitialState());

    DioHelper.getData(url: baseURl).then((value) {
      var item = value.data;
     Posts = item.map((items) => PostModel.fromJson(items)).toList();

      emit(PostsSuccessState());
    }).catchError((error) {
      print(error);
      emit(PostsErrorlState());
    });
  }
}
