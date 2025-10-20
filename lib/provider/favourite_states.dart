import '../model/item.dart';

class FavouriteStates {
  final List<Item> allItem;
  final List<Item> favouriteItem;
  final String search;
  FavouriteStates({
    required this.allItem,
    required this.favouriteItem,
    required this.search,
  });
  FavouriteStates copyWith({
    List<Item>? allItem,
    List<Item>? favouriteItem,
    String? search,
  }) {
    return FavouriteStates(
      allItem: allItem ?? this.allItem,
      favouriteItem: favouriteItem ?? this.favouriteItem,
      search: search ?? this.search,
    );
  }
}
