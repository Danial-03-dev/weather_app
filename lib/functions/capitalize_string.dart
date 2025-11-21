String capitalizeString(String string) {
  return string.isEmpty
      ? string
      : string[0].toUpperCase() + string.substring(1);
}
