class Bpm {
  final List<dynamic> r_avg;
  final List<dynamic> g_avg;
  final List<dynamic> b_avg;
  final double r_bpm;
  final double g_bpm;
  final double b_bpm;
  final double avg_bpm;

  const Bpm(
    {
      required this.r_avg,
      required this.g_avg,
      required this.b_avg,
      required this.r_bpm,
      required this.b_bpm,
      required this.g_bpm,
      required this.avg_bpm,
    }
  );

  factory Bpm.fromJson(Map<String,dynamic> json){
return Bpm(
    r_avg : json['r_avg'],
    g_avg: json['g_avg'],
    b_avg: json['b_avg'],
    r_bpm: json['r_bpm'],
    g_bpm: json['g_bpm'],
    b_bpm: json['b_bpm'],
    avg_bpm: json['avg_bpm']
  );}
}