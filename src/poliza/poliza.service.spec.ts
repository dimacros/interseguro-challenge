import { Test, TestingModule } from '@nestjs/testing';
import { PolizaService } from './poliza.service';

describe('PolizaService', () => {
  let service: PolizaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PolizaService],
    }).compile();

    service = module.get<PolizaService>(PolizaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
