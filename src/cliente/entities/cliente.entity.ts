import { Poliza } from "../../poliza/entities/poliza.entity"
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm"

@Entity({ name: 'Clientes' })
export class Cliente {
    @PrimaryGeneratedColumn()
    ID_Cliente: number

    @Column()
    Nombre_Cliente: string

    @Column()
    Direccion: string

    @Column()
    Correo_Electronico: string

    @Column()
    Numero_Telefono: string

    @Column()
    Fecha_Nacimiento: Date

    @Column({ enum: ['F', 'M']})
    Sexo: 'F' | 'M'

    @OneToMany(() => Poliza, (poliza) => poliza.Cliente)
    Polizas: Poliza[]
}
