class SparePartState {
  final int fuelFilterStock;
  final int oilFilterStock;
  final int mirrorsStock;
  final int wiperStock;
  final int batteryStock;
  final int frontGlassStock;
  final int tyresStock;

  SparePartState({
    required this.fuelFilterStock,
    required this.oilFilterStock,
    required this.mirrorsStock,
    required this.wiperStock,
    required this.batteryStock,
    required this.frontGlassStock,
    required this.tyresStock,
  });

  SparePartState copyWith({
    int? fuelFilterStock,
    int? oilFilterStock,
    int? mirrorsStock,
    int? wiperStock,
    int? batteryStock,
    int? frontGlassStock,
    int? tyresStock,
  }) {
    return SparePartState(
      fuelFilterStock: fuelFilterStock ?? this.fuelFilterStock,
      oilFilterStock: oilFilterStock ?? this.oilFilterStock,
      mirrorsStock: mirrorsStock ?? this.mirrorsStock,
      wiperStock: wiperStock ?? this.wiperStock,
      batteryStock: batteryStock ?? this.batteryStock,
      frontGlassStock: frontGlassStock ?? this.frontGlassStock,
      tyresStock: tyresStock ?? this.tyresStock,
    );
  }
}
