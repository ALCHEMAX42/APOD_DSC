class Note {
  String title;
  String url;
  String media;
  String explanation;
  String date;
  Note(this.title, this.url, this.explanation, this.date, this.media);
  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    explanation = json['explanation'];
    date = json['date'];
    url = json['url'];
    media = json['media_type'];
  }
}
