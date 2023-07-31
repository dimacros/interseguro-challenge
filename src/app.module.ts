import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SeguroModule } from './seguro/seguro.module';
import { ClienteModule } from './cliente/cliente.module';
import { PolizaModule } from './poliza/poliza.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (config: ConfigService) => ({
        type: config.get<'oracle' | 'postgres'>('DB_TYPE', 'oracle'),
        url: config.get<string>('DB_URL'),
        entities: [
          __dirname + '/**/*.entity{.ts,.js}',
        ],
      }),
      inject: [ConfigService],
    }),
    SeguroModule,
    ClienteModule, 
    PolizaModule, 
  ],
})
export class AppModule {}
