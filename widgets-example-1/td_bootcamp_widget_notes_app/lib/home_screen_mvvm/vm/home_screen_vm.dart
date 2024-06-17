import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:td_bootcamp_widget_notes_app/home_screen_mvvm/home_screen_model.dart';
import 'package:td_bootcamp_widget_notes_app/utils/random_generators.dart';

part 'home_screen_state.dart';

class HomeScreenVm extends StateNotifier<HomeScreenState>{
  
  static const initialState = HomeScreenState(notesList: [], 
  navigationState: HomeNavigationState.home);

  HomeScreenVm({HomeScreenState state = HomeScreenVm.initialState}): super(state);

  Future<void> onPlusFabBtnPressed() async{
    for(int i=0; i<20; i++){
      await Future.delayed(const Duration(seconds: 2), () {
          var newText = generateRandomString();
          var newColor = generateRandomColors();
          state = state.copyWith(notesList: [...state.notesList,
             StickyNoteModel(text: newText, color: newColor)]);
      });
    }
  } 

  Future<void> onInfoBtnPressed() async{
      state = state.copyWith(navigationState: HomeNavigationState.navigateToInfo);
  } 

  Future<void> onBackFromInfoView() async{
      state = state.copyWith(navigationState: HomeNavigationState.home);
  } 

}


