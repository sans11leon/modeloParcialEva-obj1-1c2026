import evas.*
import cuartel.*



object azuka {
  var entrenamiento = 5
 
  method efectoSincronizarCon(eva) {
    ultimoEvaSincronizado = eva
    entrenamiento += eva.puntosQueOtorga()
  }

  method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)

  var ultimoEvaSincronizado = eva_01
  method ultimoEvaSincronizado(eva) {ultimoEvaSincronizado = eva}

  method estaSatisfecha() = ultimoEvaSincronizado.campoAT() > 2115

  method puntosDeEntrenamiento() = entrenamiento
}


object shinji {
  var entrenamiento = 2
  var estaCansado = false
  const evasSincro = []
  
  method efectoSincronizarCon(eva) {
    estaCansado = true
    entrenamiento += eva.puntosQueOtorga()
    evasSincro.add(eva)
  }
  
  method descansar() {estaCansado = false}

  method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)
  
  method estaSatisfecha() = nerv.evas().all({e => evasSincro.contains(e)})

  method puntosDeEntrenamiento() = entrenamiento
}

object rei {
  var entrenamiento = 0
  var cantSincro = 0
  
  method efectoSincronizarCon(eva) {
    entrenamiento += eva.puntosQueOtorga()
    cantSincro += 1
  }
  

  method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and eva.campoAT() >=2110 and cantSincro < 5
  
  method estaSatisfecha() = cantSincro > 0

  method puntosDeEntrenamiento() = entrenamiento
}