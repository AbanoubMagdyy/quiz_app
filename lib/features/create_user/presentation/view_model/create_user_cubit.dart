import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/create_user/presentation/views/create_user_done_screen.dart';
import '../../../../core/utils/shared_preferences.dart';
import '../views/user_info_screen.dart';
part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserStates> {
  CreateUserCubit() : super(CreateUserInitial());
  static CreateUserCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const UserInfoScreen(),
    const CreateUserDoneScreen(),
  ];

  double percent = 0.5;
  void changePercent(index) {
    switch (index) {
      case 1:
        percent = 1;
    }
    emit(ChangePercent());
  }

  Future<void> saveUserData(String name) async {
    await Shared.saveDate(key: 'name', value: name);
  }
}
