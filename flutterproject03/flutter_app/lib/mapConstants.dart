class MapConstants {
  static const cDHSSettingsLocalFileName ="assets/cdhs/cdhs.json";
  static const serverAddressCDHSAddress = 'http://192.168.1.100';
  static const serverCDHSPort = '1923';
  static const serverSettingsFile = 'cdhs.json';
  static const portSeparator = ':';
  static const folderSeparator = '/';
  static const file01 = 'file01.mbtiles';

  static String getServerPathOfSettingsFile(){
    return MapConstants.serverAddressCDHSAddress+MapConstants.portSeparator+MapConstants.serverCDHSPort+MapConstants.folderSeparator+MapConstants.serverSettingsFile;
  }

  static String getServerPathOfMapFile(mapFileName){
    return MapConstants.serverAddressCDHSAddress+MapConstants.portSeparator+MapConstants.serverCDHSPort+MapConstants.folderSeparator+mapFileName;
  }
}
