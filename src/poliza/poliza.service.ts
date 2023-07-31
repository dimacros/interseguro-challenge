import { Injectable } from '@nestjs/common';
import { CreatePolizaDto } from './dto/create-poliza.dto';
import { UpdatePolizaDto } from './dto/update-poliza.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Poliza } from './entities/poliza.entity';

@Injectable()
export class PolizaService {
  constructor(
    @InjectRepository(Poliza) 
    readonly polizaRepository: Repository<Poliza>,
  ) {}

  create(createPolizaDto: CreatePolizaDto) {
    return this.polizaRepository.create(createPolizaDto);
  }

  findAll() {
    return this.polizaRepository.find();
  }

  findOne(id: number) {
    return this.polizaRepository.findOneBy({ ID_Poliza: id });
  }

  update(id: number, updatePolizaDto: UpdatePolizaDto) {
    return this.polizaRepository.update({ ID_Poliza: id }, updatePolizaDto);
  }

  remove(id: number) {
    return this.polizaRepository.delete({ ID_Poliza: id });
  }
}
