import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:td_bootcamp_widget_notes_app/home_screen_mvvm/home_screen_model.dart';
import 'package:td_bootcamp_widget_notes_app/home_screen_mvvm/vm/home_screen_vm.dart';
import 'package:td_bootcamp_widget_notes_app/info_screen.dart';
import 'package:td_bootcamp_widget_notes_app/themes/util.dart';

class HomeScreenMVVM extends ConsumerWidget {

  final HomeScreenVm _vm;
  late final StateNotifierProvider<HomeScreenVm,HomeScreenState> _homeScreenViewModelProvider;

  HomeScreenMVVM({super.key, required HomeScreenVm vm }) : _vm = vm {
    _homeScreenViewModelProvider = 
      StateNotifierProvider<HomeScreenVm,HomeScreenState>((ref) => _vm);
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final HomeScreenState state = ref.watch(_homeScreenViewModelProvider);
     ref.listen<HomeScreenState>(_homeScreenViewModelProvider, (previousState, state) async{
        if(previousState?.navigationState != state.navigationState && 
        state.navigationState == HomeNavigationState.navigateToInfo){
             Navigator.of(context)
             .push(MaterialPageRoute(builder: (context) => const InfoScreen()))
             .then((value) => _vm.onBackFromInfoView());
        }
     });
     return Scaffold(
        appBar: AppBar(
          title: Text('Notes', style: Theme.of(context).textTheme.displaySmall),
          actions: [
            Theme(
              data: getFabCustomTheme(context: context),
              child: const FloatingActionButton
              .small(onPressed: null, child: Icon(Icons.search))),
             Padding(
              padding: const EdgeInsets.fromLTRB(21,0,25,0),
              child: Theme(
                data: getFabCustomTheme(context: context),
                child:  FloatingActionButton.small(
                  onPressed: ()=> _vm.onInfoBtnPressed(), 
                  child: const Icon(Icons.info))),
            ),
          ],
        ),
        body: state.notesList.isEmpty ? _emptyViewFactory(context: context) : 
        _noteListFactory(context: context, notesList: state.notesList),
        floatingActionButton: Theme(
          data: getFabCustomTheme(context: context), 
          child: FloatingActionButton(
            onPressed: () => _vm.onPlusFabBtnPressed() , child: const Icon(Icons.add)),
        ),
    );
  }


  Widget _cardFactory({required StickyNoteModel stickyNote, required BuildContext context}) {
     return Padding(
             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
             child: Card( color: stickyNote.color, child:  Padding(
               padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 45), 
                child: Text(stickyNote.text, 
                style: Theme.of(context).textTheme.headlineSmall!
                .copyWith(color:Colors.black ))),
             ),
           );
  }

  Widget _emptyViewFactory({required BuildContext context}){
    return  SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/rafiki.png'),
              Text('Create your first note !', 
              style: Theme.of(context).textTheme.bodyMedium?.
              copyWith(fontWeight: FontWeight.w300),)
            ],
          ),
        ); 
  }

  Widget _noteListFactory({
    required List<StickyNoteModel> notesList, 
    required BuildContext context}){
    return ListView(children: notesList.reversed
    .map((stickyNote) => _cardFactory(stickyNote: stickyNote, context: context))
    .toList());
  }
}
