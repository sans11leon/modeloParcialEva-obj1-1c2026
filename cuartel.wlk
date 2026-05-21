import pilotos.*
import evas.*


object nerv {
  const property evas = []
  const pilotos = []

  method evas() = evas
  
  method registrarPiloto(piloto) { pilotos.add(piloto)}
  method registrarEva(eva) { evas.add(eva)}
  method registrarPilotos(piloto) { pilotos.addAll(piloto)}
  method registrarEvas(eva)  {evas.addAll(eva)}

  method echarPiloto(piloto) { pilotos.remove(piloto)}
  method echarEva(eva) { evas.remove(eva)}
  method echarPilotos(piloto) { pilotos.removeAll(piloto)}
  method echarEvas(eva)  {evas.removeAll(eva)}

  method intentarSincro(eva,piloto) {
    if (self.puedeSincronizar(eva,piloto)){
        eva.efectoSincronizarCon(piloto)
        piloto.efectoSincronizarCon(eva)
    }
  }

  method puedeSincronizar(eva,piloto) = eva.puedeSincronizarCon(piloto) and piloto.puedeSincronizarCon(eva)

  method ordenarAPilotoSincroConTodos(piloto) {
    evas.forEach({e => self.intentarSincro(e, piloto)})
  }

  //1     utiliza division entera para evitar confusiones
  method promedioDePuntosDePilotosEntrenados() =  self.totalDePuntosEntrenamientosDePilotos().div(self.cantPilotos())
  method totalDePuntosEntrenamientosDePilotos() = pilotos.sum({p => p.puntosDeEntrenamiento()})
  method cantPilotos() = pilotos.size()

  //2
  method pilotoMasEntrenado() = pilotos.max({p => p.puntosDeEntrenamiento()})

  //3
  method listaDeEvasAT() = evas.map({e => e.campoAT()})

  //4
  method evasQuePuedeUsar_(piloto) = evas.filter({e => self.puedeSincronizar(e, piloto)})

  //5
  method todosPuedenSincronizar() = pilotos.all({p => self.algunEvaPuedeSincroCon(p)})
  method algunEvaPuedeSincroCon(piloto) =evas.any({e => self.puedeSincronizar(e, piloto)}) 

  //6
  method estaSatisfecho_(piloto) = piloto.estaSatisfecha()
}