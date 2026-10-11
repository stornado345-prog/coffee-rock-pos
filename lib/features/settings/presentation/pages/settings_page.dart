import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pb1Enabled = true;
  bool _serviceChargeEnabled = true;
  bool _autoPrintReceipt = true;
  bool _kickDrawerOnCash = true;
  String _selectedPrinter = 'Epson TM-T88VI (192.168.1.150)';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.canvas,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terminal & Store Settings',
            style: AppTypography.headlineLarge.copyWith(
              color: AppColors.espressoBrown,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Hardware interfaces, tax rules, and active cashier workstation preferences',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: [
                // Store Info Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.beige),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Outlet Profile & Branding',
                          style: AppTypography.headlineSmall),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: AppColors.espressoBrown,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.coffee,
                                color: AppColors.warmCream, size: 30),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.appName,
                                style: AppTypography.headlineSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${AppConstants.brandTagline} • Jl. Senopati No. 42, Kebayoran Baru, Jakarta Selatan',
                                style: AppTypography.bodySmall,
                              ),
                              Text(
                                'Terminal Station: 01 (Landscape Android Tablet)',
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.caramel,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Financial & Tax Rules Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.beige),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tax & Surcharge Policies',
                          style: AppTypography.headlineSmall),
                      const SizedBox(height: 10),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('PB1 Local Government Restaurant Tax (10%)'),
                        subtitle: const Text(
                            'Mandatory municipal F&B tax calculated on ticket subtotal'),
                        value: _pb1Enabled,
                        activeColor: AppColors.espressoBrown,
                        onChanged: (val) => setState(() => _pb1Enabled = val),
                      ),
                      const Divider(color: AppColors.beige),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Hospitality Service Charge (5%)'),
                        subtitle: const Text(
                            'Internal tip pool distributed directly to floor baristas'),
                        value: _serviceChargeEnabled,
                        activeColor: AppColors.espressoBrown,
                        onChanged: (val) =>
                            setState(() => _serviceChargeEnabled = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Hardware Peripheral Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.beige),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thermal Printer & Cash Drawer',
                          style: AppTypography.headlineSmall),
                      const SizedBox(height: 14),
                      DropdownButtonFormField<String>(
                        value: _selectedPrinter,
                        decoration: const InputDecoration(
                          labelText: 'Primary ESC/POS Receipt Printer',
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Epson TM-T88VI (192.168.1.150)',
                            child: Text('Epson TM-T88VI (LAN IP: 192.168.1.150)'),
                          ),
                          DropdownMenuItem(
                            value: 'Star Micronics TSP143 (Bluetooth)',
                            child: Text('Star Micronics TSP143 (Bluetooth BT-01)'),
                          ),
                          DropdownMenuItem(
                            value: 'Sunmi Internal 80mm Printer',
                            child: Text('Sunmi Built-in 80mm Thermal Printer'),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _selectedPrinter = val);
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Auto-print receipt upon transaction complete'),
                        value: _autoPrintReceipt,
                        activeColor: AppColors.espressoBrown,
                        onChanged: (val) => setState(() => _autoPrintReceipt = val),
                      ),
                      const Divider(color: AppColors.beige),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Kick Cash Drawer on Cash Tender confirmation'),
                        value: _kickDrawerOnCash,
                        activeColor: AppColors.espressoBrown,
                        onChanged: (val) => setState(() => _kickDrawerOnCash = val),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
