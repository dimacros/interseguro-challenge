import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PolizaService } from './poliza.service';
import { CreatePolizaDto } from './dto/create-poliza.dto';
import { UpdatePolizaDto } from './dto/update-poliza.dto';

@Controller('polizas')
export class PolizaController {
  constructor(private readonly polizaService: PolizaService) {}

  @Post()
  create(@Body() createPolizaDto: CreatePolizaDto) {
    return this.polizaService.create(createPolizaDto);
  }

  @Get()
  findAll() {
    return this.polizaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.polizaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatePolizaDto: UpdatePolizaDto) {
    return this.polizaService.update(+id, updatePolizaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.polizaService.remove(+id);
  }
}
