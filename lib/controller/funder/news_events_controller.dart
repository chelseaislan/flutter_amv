import 'package:flutter_amv/model/funder/news_status.dart';
import 'package:get/get.dart';

class NewsEventsController extends GetxController {
  var newsEvents = <NewsEventsInfo>[].obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() {
    var newsList = [
      NewsEventsInfo("https://astraventura.co.id/img/360x270/article/2650401-1620376329.jpg", "Sistem ERP Untuk Industri Kecil Menengah",
          "Astra Ventura", "22 Juni 2021", () {}),
      NewsEventsInfo("https://astraventura.co.id/img/360x270/article/whatsapp-i-1620410110.jpeg", "Sistem ERP Untuk Industri Kecil Menengah",
          "Astra Ventura", "22 Juni 2021", () {}),
      NewsEventsInfo("https://astraventura.co.id/img/360x270/article/whatsapp-i-1620413401.jpeg", "Sistem ERP Untuk Industri Kecil Menengah",
          "Astra Ventura", "22 Juni 2021", () {}),
    ];
    newsEvents.assignAll(newsList);
  }
}
