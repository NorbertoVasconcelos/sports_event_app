enum SportEventDate { yesterday, today, tomorrow }

extension SportEventDateExtension on SportEventDate {
  String get name {
    switch (this) {
      case SportEventDate.yesterday:
        return 'YESTERDAY';
      case SportEventDate.today:
        return 'TODAY';
      case SportEventDate.tomorrow:
        return 'TOMORROW';
      default:
        return '';
    }
  }

  static SportEventDate fromString(String date) {
    switch (date.toUpperCase()) {
      case 'YESTERDAY':
        return SportEventDate.yesterday;
      case 'TODAY':
        return SportEventDate.today;
      case 'TOMORROW':
        return SportEventDate.tomorrow;
      default:
        return SportEventDate.today;
    }
  }
}
