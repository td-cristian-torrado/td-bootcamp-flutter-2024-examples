part of 'package:td_bootcamp_widget_notes_app/home_screen_mvvm/vm/home_screen_vm.dart';

class HomeScreenState {

  final List<StickyNoteModel> notesList;
  final HomeNavigationState navigationState;

  const HomeScreenState({required this.notesList, required this.navigationState});

  HomeScreenState copyWith({
    List<StickyNoteModel>? notesList, 
    HomeNavigationState? navigationState}){
    return HomeScreenState(notesList: notesList ?? this.notesList, 
    navigationState: navigationState ?? this.navigationState);
  }

}

enum HomeNavigationState {
  home,
  navigateToInfo
}
