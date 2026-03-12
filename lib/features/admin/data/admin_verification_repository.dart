import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/network_providers.dart';

class AdminVerificationItem {
  AdminVerificationItem({
    required this.id,
    required this.name,
    required this.status,
    required this.documentUrl,
    required this.selfieUrl,
    this.email,
    this.phone,
  });

  final String id;
  final String name;
  final String status;
  final String? documentUrl;
  final String? selfieUrl;
  final String? email;
  final String? phone;

  factory AdminVerificationItem.fromJson(Map<String, dynamic> json) {
    final firstName = (json['firstName'] ?? '').toString();
    final lastName = (json['lastName'] ?? '').toString();
<<<<<<< HEAD
    final fallbackName = ('$firstName $lastName').trim();

    return AdminVerificationItem(
      id: json['id'].toString(),
      name: (json['name'] as String?)?.trim().isNotEmpty == true
          ? (json['name'] as String).trim()
          : fallbackName,
      status: (json['status'] ?? json['verificationStatus'] ?? '').toString(),
      documentUrl:
          (json['documentUrl'] ?? json['verificationDocumentUrl']) as String?,
      selfieUrl:
          (json['selfieUrl'] ?? json['verificationSelfieUrl']) as String?,
=======

    return AdminVerificationItem(
      id: json['id'].toString(),
      name: ('$firstName $lastName').trim(),
      status: (json['verificationStatus'] ?? '').toString(),
      documentUrl: json['verificationDocumentUrl'] as String?,
      selfieUrl: json['verificationSelfieUrl'] as String?,
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }
}

class AdminVerificationRepository {
  const AdminVerificationRepository(this._dio);
  final Dio _dio;

  Future<List<AdminVerificationItem>> pending() async {
<<<<<<< HEAD
    final res = await _dio.get('/admin/verifications/pending');
    final data = res.data;

    final List items;
    if (data is List) {
      items = data;
    } else if (data is Map<String, dynamic>) {
      items = (data['items'] as List?) ?? const [];
    } else {
      items = const [];
    }

    return items
        .whereType<Map>()
        .map((e) => AdminVerificationItem.fromJson(
              e.cast<String, dynamic>(),
            ))
=======
    final res = await _dio.get<Map<String, dynamic>>(
      '/admin/verifications/pending',
    );

    final items = (res.data?['items'] as List? ?? const []);
    return items
        .whereType<Map<String, dynamic>>()
        .map(AdminVerificationItem.fromJson)
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
        .toList();
  }

  Future<void> approve(String userId) async {
    await _dio.patch('/admin/verifications/$userId/approve');
  }

  Future<void> reject(String userId, {String? reason}) async {
    await _dio.patch('/admin/verifications/$userId/reject', data: {
      if (reason != null && reason.isNotEmpty) 'reason': reason,
    });
  }
}

final adminVerificationRepositoryProvider =
    Provider<AdminVerificationRepository>((ref) {
  return AdminVerificationRepository(ref.read(dioProvider));
<<<<<<< HEAD
});
=======
});
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
