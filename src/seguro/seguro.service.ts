import { Injectable } from '@nestjs/common';
import { CreateSeguroDto } from './dto/create-seguro.dto';
import { UpdateSeguroDto } from './dto/update-seguro.dto';
import { Repository } from 'typeorm';
import { Seguro } from './entities/seguro.entity';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class SeguroService {
  constructor(
    @InjectRepository(Seguro) 
    private seguroRepository: Repository<Seguro>,
  ) {}

  create(createSeguroDto: CreateSeguroDto) {
    return this.seguroRepository.create(createSeguroDto);
  }

  findAll() {
    return this.seguroRepository.find();
  }

  findOne(id: number) {
    return this.seguroRepository.findOneBy({ ID_Seguro: id });
  }

  update(id: number, updateSeguroDto: UpdateSeguroDto) {
    return this.seguroRepository.update({ ID_Seguro: id }, updateSeguroDto);
  }

  remove(id: number) {
    return this.seguroRepository.delete({ ID_Seguro: id });
  }
}
