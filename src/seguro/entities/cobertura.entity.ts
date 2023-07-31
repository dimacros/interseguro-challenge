import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm"
import { Seguro } from "./seguro.entity"

@Entity({ name: 'Coberturas' })
export class Cobertura {
    @PrimaryGeneratedColumn()
    ID_Cobertura: number

    @Column()
    Nombre_Cobertura: string

    @Column()
    Descripcion: string
    
    @OneToMany(() => Seguro, (seguro) => seguro.Cobertura)
    Seguros: Seguro[]
}