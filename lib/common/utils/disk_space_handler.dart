import 'package:disk_space/disk_space.dart';

class DiskSpaceHandler {
  static Future<double> getDiskSpace() async {
    return await DiskSpace.getFreeDiskSpace ?? 100;
  }
}
