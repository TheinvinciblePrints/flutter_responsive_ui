enum Environment { DEV, STAGING, PROD }

class AppConstants {
  static Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.devConstants;
        break;
      case Environment.STAGING:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get SERVER {
    return _config[_Config.SERVER];
  }

  static get APP_TITLE {
    return _config[_Config.APP_TITLE];
  }

  static get WHERE_AM_I {
    return _config[_Config.WHERE_AM_I];
  }
}

class _Config {
  static const SERVER = "SERVER";
  static const WHERE_AM_I = "WHERE_AM_I";
  static const APP_TITLE = "TITLE";

  // Development Environment
  static Map<String, dynamic> devConstants = {
    SERVER: "https://jsonplaceholder.typicode.com/",
    WHERE_AM_I: "dev",
    APP_TITLE: "Flutter",
  };

  // Staging Environment
  static Map<String, dynamic> qaConstants = {
    SERVER: "https://staging1.example.com/",
    WHERE_AM_I: "staging",
    APP_TITLE: "Flutter",
  };

  // Production Environment
  static Map<String, dynamic> prodConstants = {
    SERVER: "https://jsonplaceholder.typicode.com/",
    WHERE_AM_I: "prod",
    APP_TITLE: "Flutter",
  };
}
