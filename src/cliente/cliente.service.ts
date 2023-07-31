import { Injectable } from '@nestjs/common';
import { CreateClienteDto } from './dto/create-cliente.dto';
import { UpdateClienteDto } from './dto/update-cliente.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Cliente } from './entities/cliente.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ClienteService {
  constructor(
    @InjectRepository(Cliente) 
    readonly clienteRepository: Repository<Cliente>,
  ) {}

  create(createClienteDto: CreateClienteDto) {
    this.clienteRepository.create(createClienteDto);
  }

  findAll() {
    return this.clienteRepository.find();
  }

  findOne(id: number) {
    return this.clienteRepository.findOneBy({ ID_Cliente: id });
  }

  update(id: number, updateClienteDto: UpdateClienteDto) {
    return this.clienteRepository.update({ ID_Cliente: id }, updateClienteDto);
  }

  remove(id: number) {
    return this.clienteRepository.delete({ ID_Cliente: id });
  }
}
