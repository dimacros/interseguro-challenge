import { Module } from '@nestjs/common';
import { PolizaService } from './poliza.service';
import { PolizaController } from './poliza.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Poliza } from './entities/poliza.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([Poliza])
  ],
  controllers: [PolizaController],
  providers: [PolizaService]
})
export class PolizaModule {}
