
abstract class HomeEvent {}

class NavigationPositionChangeEvent extends HomeEvent{
  final int pos;

  NavigationPositionChangeEvent(this.pos);

}