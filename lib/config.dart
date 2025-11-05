class Config {
  static int port = 80;
  static String host = Uri.base.host;
  static String token = "";
  static String scheme = "http";
  static getUrl() {
    return '${Config.host}:${Config.port}';
  }
}
