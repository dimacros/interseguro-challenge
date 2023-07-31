import { Poliza } from "src/poliza/entities/poliza.entity"
import { Entity, PrimaryGeneratedColumn, Column, OneToMany, ManyToOne, JoinColumn } from "typeorm"
import { Cobertura } from "./cobertura.entity"

@Entity({ name: 'Seguros' })
export class Seguro {
    @PrimaryGeneratedColumn()
    ID_Seguro: number

    @ManyToOne(() => Cobertura, (cobertura) => cobertura.Seguros, { eager: true })
    @JoinColumn({ name: 'ID_Cobertura' })
    Cobertura: Cobertura

    @Column()
    Nombre_Seguro: string

    @Column()
    Descripcion: string

    @Column()
    Precio: string

    @Column()
    Moneda: string

    @Column()
    Duracion: string

    @OneToMany(() => Poliza, (poliza) => poliza.Seguro)
    Polizas: Poliza[]
}