class Shipment {
  final String id;
  final String item;
  final String origin;
  final String destination;
  final String price;
  final String date;
  final ShipmentStatus status;

  const Shipment({
    required this.id,
    required this.item,
    required this.origin,
    required this.destination,
    required this.price,
    required this.date,
    required this.status,
  });

  static const List<Shipment> shipments = [
    Shipment(
      id: "#NE4399201946843",
      item: "Macbook pro M2",
      origin: "Paris",
      destination: "Morocco",
      price: "\$650 USD",
      date: "Sep 20, 2023",
      status: ShipmentStatus.inProgress,
    ),
    Shipment(
      id: "#NE9083828938248",
      item: "Summer linen jacket",
      origin: "Barcelona",
      destination: "Paris",
      price: "\$450 USD",
      date: "Sep 20, 2023",
      status: ShipmentStatus.pending,
    ),
    Shipment(
      id: "#NE03204885384347",
      item: "Tapered-fit jeans AW",
      origin: "Colombia",
      destination: "Paris",
      price: "\$230 USD",
      date: "Sep 20, 2023",
      status: ShipmentStatus.inProgress,
    ),
    Shipment(
      id: "#NE190284737430432",
      item: "Slim fit jeans AW",
      origin: "Bogota",
      destination: "Dakar",
      price: "\$350 USD",
      date: "Sep 20, 2023",
      status: ShipmentStatus.inProgress,
    ),
    Shipment(
      id: "#NE234712782730363",
      item: "Office setup desk",
      origin: "France",
      destination: "Germany",
      price: "\$230 USD",
      date: "Sep 20, 2023",
      status: ShipmentStatus.pending,
    ),
  ];
}

enum ShipmentStatus { completed, inProgress, pending, cancelled }
