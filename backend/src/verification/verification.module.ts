import { Module } from '@nestjs/common';
import { VerificationService } from './verification.service';
import { VerificationController } from './verification.controller';
<<<<<<< HEAD

@Module({
  controllers: [VerificationController],
=======
import { AdminVerificationController } from './dto/admin-verification.controller';

@Module({
  controllers: [VerificationController, AdminVerificationController],
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  providers: [VerificationService],
  exports: [VerificationService],
})
export class VerificationModule {}