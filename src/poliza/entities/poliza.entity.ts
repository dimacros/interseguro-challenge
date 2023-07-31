import { Seguro } from "src/seguro/entities/seguro.entity"
import { Cliente } from "../../cliente/entities/cliente.entity"
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from "typeorm"

@Entity({ name: 'Polizas' })
export class Poliza {
    @PrimaryGeneratedColumn()
    ID_Poliza: number

    @ManyToOne(() => Cliente, (cliente) => cliente.Polizas)
    @JoinColumn({ name: 'ID_Cliente' })
    Cliente: Cliente

    @ManyToOne(() => Seguro, (seguro) => seguro.Polizas)
    @JoinColumn({ name: 'ID_Seguro' })
    Seguro: Seguro

    @Column()
    Fecha_Inicio: Date

    @Column()
    Fecha_Vencimiento: Date

    @Column()
    Estado_Poliza: string
}
