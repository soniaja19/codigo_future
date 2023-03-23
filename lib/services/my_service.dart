class MyService {
  Future<Map<String, dynamic>> getProfile() {
    return Future.delayed(const Duration(seconds: 3), () {
      return {
        "id": 10,
        "name": "Sonia",
        "last name": "Justiniano Ayte",
        "phone": "927 927 956",
        "adress": "Mz F Lote 19 - Los Heraldos",
        "image":
            "https://images.pexels.com/photos/1758144/pexels-photo-1758144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      };
    });
  }
}
