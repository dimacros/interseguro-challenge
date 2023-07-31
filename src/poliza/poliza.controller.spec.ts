import { Test, TestingModule } from '@nestjs/testing';
import { PolizaController } from './poliza.controller';
import { PolizaService } from './poliza.service';

describe('PolizaController', () => {
  let controller: PolizaController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PolizaController],
      providers: [PolizaService],
    }).compile();

    controller = module.get<PolizaController>(PolizaController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
