T tryC<T>(T Function() callback, {T Function(dynamic e) fallback}) {
  T result;
  fallback ??= (e) => null;

  try {
    result = callback();
  } catch (e) {
    result = fallback(e);
  }
  return result;
}
