class DataModel {
  final String title;
  final String imageName;
  final String ageSpan;
  final String intrests;

  DataModel(
    this.title,
    this.imageName,
    this.ageSpan,
    this.intrests,
  );
}

List<DataModel> dataList = [
  DataModel("Techie Tarun", "assets/images/techie.png", "(Age: 24yrs - 35yrs)",
      "coding, technologies, techie and so on"),
  DataModel(
      "Smarty Sweetha",
      "assets/images/smarty.png",
      "(Age: 36yrs - 45yrs)",
      "cooking, youtube, kids safety, series, vlogs and so on"),
  DataModel("Reliable Raj", "assets/images/raj.png", "(Age: 45yrs - 60yrs)",
      "gardening, whatsapp forwards, facebook etc")
];
