class Settings{
  final int selectedColor;
  final bool isDarkMode;

  Settings(
      this.selectedColor,
      this.isDarkMode
      );

  Map<String, dynamic> toJson(){
    return {
      'selectedColor': selectedColor,
      'isDarkMode': isDarkMode,
    };
  }

  factory Settings.fromJson(Map<String, dynamic> json){
    return Settings(
      json['selectedColor'] as int,
      json['isDarkMode'] as bool,
    );
  }
}