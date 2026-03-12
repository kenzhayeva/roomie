import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { CommonModule } from './common/common.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { ListingsModule } from './listings/listings.module';
import { SavedModule } from './saved/saved.module';
import { OnboardingModule } from './onboarding/onboarding.module';
import { VerificationModule } from './verification/verification.module';
import { AdminVerificationsModule } from './admin-verifications/admin-verifications.module';
import { FavoritesUsersModule } from './favorites-users/favorites-users.module';
<<<<<<< HEAD
import { ChatModule } from './chat/chat.module';
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', 'uploads'),
      serveRoot: '/uploads',
    }),
    PrismaModule,
    CommonModule,
    AuthModule,
    UsersModule,
    ListingsModule,
    SavedModule,
    OnboardingModule,
    VerificationModule,
    AdminVerificationsModule,
    FavoritesUsersModule,
<<<<<<< HEAD
    ChatModule,
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
