<<<<<<< HEAD
﻿import { Injectable, OnModuleDestroy, OnModuleInit } from '@nestjs/common';
=======
import { Injectable, OnModuleInit, OnModuleDestroy } from '@nestjs/common';
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  constructor() {
<<<<<<< HEAD
    super();
=======
    super(); 
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  }

  async onModuleInit() {
    await this.$connect();
  }

  async onModuleDestroy() {
    await this.$disconnect();
  }
}
