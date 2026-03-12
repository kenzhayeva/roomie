import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    private configService: ConfigService,
    private prisma: PrismaService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: configService.get<string>('JWT_ACCESS_SECRET'),
    });
  }

  async validate(payload: {
    sub: string;
    email?: string | null;
    phone?: string | null;
  }) {
    const user = await this.prisma.user.findUnique({
      where: { id: payload.sub },
      select: {
        id: true,
        email: true,
        phone: true,
<<<<<<< HEAD
        role: true,
        isBanned: true,
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
        firstName: true,
        lastName: true,
        gender: true,
        age: true,
        city: true,
        bio: true,
        emailVerified: true,
        phoneVerified: true,
        onboardingStep: true,
        onboardingCompleted: true,
      },
    });

    if (!user) {
      throw new UnauthorizedException('User not found');
    }
<<<<<<< HEAD
    if (user.isBanned) {
      throw new UnauthorizedException('Account is banned');
    }
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2

    return user;
  }
}
