import '../model/item.dart';

class FavouriteStates {
  final List<Item> allItem;
  final List<Item> filteredItem;
  final String search;
  FavouriteStates({
    required this.allItem,
    required this.filteredItem,
    required this.search,
  });
  FavouriteStates copyWith({
    List<Item>? allItem,
    List<Item>? favouriteItem,
    String? search,
  }) {
    return FavouriteStates(
      allItem: allItem ?? this.allItem,
      filteredItem: favouriteItem ?? this.filteredItem,
      search: search ?? this.search,
    );
  }
}
