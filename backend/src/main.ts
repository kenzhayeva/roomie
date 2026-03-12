import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { join } from 'path';
import { NestExpressApplication } from '@nestjs/platform-express';
<<<<<<< HEAD
import { Response } from 'express';
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

<<<<<<< HEAD
  // CORS
  app.enableCors({
    origin: true,
    credentials: true,
  });

  // Global prefix
  app.setGlobalPrefix('api');

  // Validation
=======
  // ✅ uploads сыртқа беру
  app.useStaticAssets(join(process.cwd(), 'uploads'), {
    prefix: '/uploads',
  });

  app.setGlobalPrefix('api');

>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
<<<<<<< HEAD
      transformOptions: {
        enableImplicitConversion: true,
      },
    }),
  );

  // Serve uploads statically
  app.useStaticAssets(join(process.cwd(), 'uploads'), {
    prefix: '/uploads',
  });

  // Serve admin web panel
  app.useStaticAssets(join(process.cwd(), 'admin-web'), {
    prefix: '/admin',
  });

  // Open admin panel by /admin (without explicit /index.html)
  const expressApp = app.getHttpAdapter().getInstance();
  expressApp.get('/admin', (_req: any, res: Response) => {
    res.sendFile(join(process.cwd(), 'admin-web', 'index.html'));
  });
  expressApp.get('/admin/', (_req: any, res: Response) => {
    res.sendFile(join(process.cwd(), 'admin-web', 'index.html'));
  });

  // Swagger
=======
      transformOptions: { enableImplicitConversion: true },
    }),
  );

>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  const config = new DocumentBuilder()
    .setTitle('Roomie API')
    .setDescription('Roommate app backend API')
    .setVersion('1.0')
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

<<<<<<< HEAD
  await app.listen(process.env.PORT ?? 3001);
}

bootstrap();
=======
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
