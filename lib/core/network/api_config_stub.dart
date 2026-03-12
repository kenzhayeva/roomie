String getApiBaseUrl() {
  return const String.fromEnvironment(
    'API_BASE_URL',
<<<<<<< HEAD
    defaultValue: 'http://localhost:3001/api',
=======
    defaultValue: 'http://localhost:3000/api',
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  );
}

String getPublicBaseUrl() {
  return const String.fromEnvironment(
    'PUBLIC_BASE_URL',
<<<<<<< HEAD
    defaultValue: 'http://localhost:3001',
  );
}
=======
    defaultValue: 'http://localhost:3000',
  );
}
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
