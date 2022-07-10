abstract class CubityState {}

class CubityinitialState extends CubityState {}

class NavChangeIconState extends CubityState {}
class SelctedItemState extends CubityState {}
class SetDesktopState extends CubityState {}

class NewGetBusniessLoadingState extends CubityState {}

class NewGetBusniessSuccessState extends CubityState {}

class NewGetBusniessErrorState extends CubityState {
  final error;
  NewGetBusniessErrorState(this.error);
}

class NewGetScienceLoadingState extends CubityState {}

class NewGetScienceSuccessState extends CubityState {}

class NewGetScienceErrorState extends CubityState {
  final error;
  NewGetScienceErrorState(this.error);
}

class NewGetSportLoadingState extends CubityState {}

class NewGetSportSuccessState extends CubityState {}

class NewGetSportErrorState extends CubityState {
  final error;
  NewGetSportErrorState(this.error);
}