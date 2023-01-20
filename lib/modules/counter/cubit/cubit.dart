import 'package:bmi_flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterCubit extends Cubit<counterStates>{
  counterCubit() : super(initState());

  static counterCubit get(context)=>BlocProvider.of(context);
  int counter=1;

  void minus(){
    counter--;
    emit(minusState(counter));
  }
  void plus(){
    counter++;
    emit(plusState(counter));
  }
}