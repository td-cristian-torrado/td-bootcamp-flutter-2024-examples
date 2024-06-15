import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:td_bootcamp_widget_notes_app/home_screen_mvvm/vm/home_screen_state.dart';

class HomeScreenVm extends StateNotifier<HomeScreenState>{
  
  static const initialState = HomeScreenState(notesList: []);

  HomeScreenVm({HomeScreenState state = HomeScreenVm.initialState}): super(state);

  

}


