class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScannr;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.error = "",
    this.barcode = "",
    this.stopScannr = false,
  });

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(isCameraAvailable: true, stopScannr: false);

  factory BarcodeScannerStatus.error(String message) =>
      BarcodeScannerStatus(error: message, stopScannr: true);

  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(error: barcode, stopScannr: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}
