import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../cart/presentation/viewmodels/cart_viewmodel.dart';
import '../../domain/entities/payment.dart';
import '../viewmodels/checkout_viewmodel.dart';
import 'receipt_dialog.dart';

class PaymentDialog extends ConsumerStatefulWidget {
  const PaymentDialog({super.key});

  @override
  ConsumerState<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends ConsumerState<PaymentDialog> {
  int _cashGiven = 0;

  @override
  void initState() {
    super.initState();
    final total = ref.read(cartViewModelProvider).totalDue;
    _cashGiven = total;
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartViewModelProvider);
    final checkoutState = ref.watch(checkoutViewModelProvider);
    final checkoutNotifier = ref.read(checkoutViewModelProvider.notifier);

    final totalDue = cartState.totalDue;
    final changeDue = _cashGiven >= totalDue ? _cashGiven - totalDue : 0;

    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 640,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tender & Payment',
                      style: AppTypography.headlineMedium.copyWith(
                        color: AppColors.espressoBrown,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Ticket ${cartState.orderNumber} • ${cartState.tableName}',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Total Due Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.beige),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL TAGIHAN',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.espressoBrown,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    CurrencyFormatter.format(totalDue),
                    style: AppTypography.displayLg.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.espressoBrown,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Method Selector
            Row(
              children: [
                _buildMethodTab(
                  method: PaymentMethod.qris,
                  icon: Icons.qr_code_scanner,
                  title: 'QRIS',
                  isSelected: checkoutState.selectedMethod == PaymentMethod.qris,
                ),
                const SizedBox(width: 10),
                _buildMethodTab(
                  method: PaymentMethod.edc,
                  icon: Icons.contactless,
                  title: 'EDC Card',
                  isSelected: checkoutState.selectedMethod == PaymentMethod.edc,
                ),
                const SizedBox(width: 10),
                _buildMethodTab(
                  method: PaymentMethod.cash,
                  icon: Icons.payments,
                  title: 'Cash Drawer',
                  isSelected: checkoutState.selectedMethod == PaymentMethod.cash,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dynamic Body by Method
            if (checkoutState.selectedMethod == PaymentMethod.qris)
              _buildQrisSection()
            else if (checkoutState.selectedMethod == PaymentMethod.edc)
              _buildEdcSection()
            else
              _buildCashSection(totalDue, changeDue),

            const SizedBox(height: 24),

            // Confirm Button
            ElevatedButton(
              onPressed: checkoutState.isProcessing
                  ? null
                  : () async {
                      if (checkoutState.selectedMethod == PaymentMethod.cash) {
                        checkoutNotifier.setCashTender(_cashGiven);
                      }
                      final success = await checkoutNotifier.processPayment();
                      if (success && mounted) {
                        final order = ref.read(checkoutViewModelProvider).lastCompletedOrder;
                        Navigator.pop(context);
                        if (order != null) {
                          showDialog(
                            context: context,
                            builder: (ctx) => ReceiptDialog(order: order),
                          );
                        }
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.espressoBrown,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: checkoutState.isProcessing
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.white,
                      ),
                    )
                  : Text(
                      'Selesaikan Pembayaran (${CurrencyFormatter.format(totalDue)})',
                      style: AppTypography.headlineSmall.copyWith(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodTab({
    required PaymentMethod method,
    required IconData icon,
    required String title,
    required bool isSelected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ref.read(checkoutViewModelProvider.notifier).setPaymentMethod(method);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.espressoBrown : AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.espressoBrown : AppColors.beige,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.white : AppColors.espressoBrown,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: AppTypography.labelLarge.copyWith(
                  color: isSelected ? AppColors.white : AppColors.espressoBrown,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrisSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.beige),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.beige),
            ),
            child: const Icon(
              Icons.qr_code_2,
              size: 90,
              color: AppColors.espressoBrown,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'QRIS Dinamis Siap Scan',
                      style: AppTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.espressoBrown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Arahkan kamera aplikasi GoPay, OVO, Dana, BCA, atau Livin Mandiri customer ke kode QR di layar tablet.',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Merchant ID: COFFEEROCK-STATION01',
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEdcSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.beige),
      ),
      child: Row(
        children: [
          const Icon(Icons.credit_card, size: 50, color: AppColors.caramel),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mesin EDC Siap Menerima Kartu',
                  style: AppTypography.labelLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.espressoBrown,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Silakan masukkan kartu debit / kredit atau tap Contactless (Visa/Mastercard/BCA/Mandiri).',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCashSection(int totalDue, int changeDue) {
    return Column(
      children: [
        // Cash Amount Given
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Uang Tunai Diterima:', style: AppTypography.bodyMedium),
            Text(
              CurrencyFormatter.format(_cashGiven),
              style: AppTypography.numericCurrency.copyWith(
                fontSize: 18,
                color: AppColors.espressoBrown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Quick Preset Chips
        Row(
          children: [
            _buildPresetChip('Pas', totalDue),
            const SizedBox(width: 8),
            _buildPresetChip('Rp 200.000', 200000),
            const SizedBox(width: 8),
            _buildPresetChip('Rp 250.000', 250000),
            const SizedBox(width: 8),
            _buildPresetChip('Rp 300.000', 300000),
          ],
        ),
        const SizedBox(height: 14),

        // Change Due Card
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: changeDue > 0
                ? const Color(0xFFE8F5E9)
                : AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: changeDue > 0
                  ? const Color(0xFF81C784)
                  : AppColors.beige,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kembalian (Change Due):',
                style: AppTypography.labelLarge.copyWith(
                  color: changeDue > 0
                      ? const Color(0xFF2E7D32)
                      : AppColors.espressoBrown,
                ),
              ),
              Text(
                CurrencyFormatter.format(changeDue),
                style: AppTypography.displayLg.copyWith(
                  fontSize: 22,
                  color: changeDue > 0
                      ? const Color(0xFF1B5E20)
                      : AppColors.espressoBrown,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPresetChip(String label, int amount) {
    final isSelected = _cashGiven == amount;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _cashGiven = amount),
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.espressoBrown : AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTypography.labelSm.copyWith(
              color: isSelected ? AppColors.white : AppColors.espressoBrown,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
