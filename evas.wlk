import modos.*

object eva_01 {
    var campoAT = 2110
    method campoAT() = campoAT

    var energia = 100
    method energia() = energia

    method efectoSincronizarCon(piloto) {
      energia = energia - 25
      campoAT = 2150.min(campoAT + 1)
      piloto.efectoSincronizarCon(self)
    }

    method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamiento() >= 4 and energia > 30

    method puntosQueOtorga() = 2

    method recargaEnergia(horas) {
      energia = 100.min(30*horas)
    }
}


object eva_02 {
    method campoAT() = 2114

    var energia = 100
    method energia() = energia

    var modo = estandar
    method cambiarModo(unModo) {modo = unModo}

    method consumoDelModo() = modo.consumo()

    method efectoSincronizarCon(piloto) {
      energia -= self.consumoDelModo()
      piloto.efectoSincronizarCon(self)
    }

    method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamiento() >= 2 and energia > 20

    method puntosQueOtorga() = modo.puntosQueOtorga()

    method recargaEnergia(horas) {
      energia = 100.min(25*horas)
    }
}

object eva_00 {
    var campoAT = 2100
    method campoAT() = campoAT

    //Fuerza debe ser >= 0
    method mejorarCampoAT(fuerza) {
      campoAT = 2150.min(campoAT+fuerza)
    }

    method efectoSincronizarCon(piloto) {
      piloto.efectoSincronizarCon(self)
    }

    method puedeSincronizarCon(piloto) = true

    method puntosQueOtorga() = 1
}