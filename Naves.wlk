class Naves {
  var velocidad = 0
  var direccionRespectoAlSol = 10
  method velocidad() = velocidad
  method direccionRespectoAlSol() = direccionRespectoAlSol
  method acelerar(cuanto) {velocidad = (velocidad + cuanto).min(100000)}
  method desacelerar(cuanto) {velocidad = (velocidad - cuanto).min(0)}
  method irHaciaElSol() {direccionRespectoAlSol = 10}
  method escaparDelSol() {direccionRespectoAlSol = -10}
  method ponerseParaleloAlSol() {direccionRespectoAlSol = 0}
  method acercarseUnPocoAlSol() {direccionRespectoAlSol +=1.min(10)}
  method alejarseUnPocoDelSol() {direccionRespectoAlSol -=1.max(-10)}
  method prepararViaje()
  var property combustible = 0
  method cargarCombustible(cantidad){combustible+=cantidad}
  method descargarCombustible(cantidad){combustible-=cantidad.max(0)}
}

class NavesBaliza inherits Naves{
  var colorBaliza = "azul"
  method colorBaliza() = colorBaliza
  method cambiarColorDeBaliza(color) { colorBaliza = color}
  override method prepararViaje(){
    self.cambiarColorDeBaliza("rojo")
    self.ponerseParaleloAlSol()
  }
}

class NavesDePasajeros inherits Naves{
  var property cantidadDePasajeros = 0
  var cantidadDeRacionesDeComida = 0
  var cantidadDeRacionesDeAgua = 0
  method cantidadDeRacionesDeAgua() = cantidadDeRacionesDeAgua
  method candtidadDeRacionesDeComida() = cantidadDeRacionesDeComida
  method cantidadDePasajeros() = cantidadDePasajeros 
  method cargarRacionesDeComida(cantidad) {cantidadDeRacionesDeComida += cantidad*cantidadDePasajeros}
  method descargarRacionesDeComida(cantidad) {cantidadDeRacionesDeComida -= cantidad*cantidadDePasajeros} 
  method cargarRacionesDeAgua(cantidad) {cantidadDeRacionesDeAgua += cantidad} 
  method descargarRacionesDeAgia(cantidad) {cantidadDeRacionesDeAgua -= cantidad}
  override method prepararViaje(){
    self.cargarRacionesDeComida(4)
    self.cargarRacionesDeAgua(6)
    self.acercarseUnPocoAlSol()}

}

class NavesDeCombate inherits Naves {
  var property estaInvisible = true
  method ponerseVisible(){estaInvisible = true}
  method ponerseInvisible(){estaInvisible = false}
  var property misilesDesplegados = true
  method desplegarMisiles(){misilesDesplegados = true}
  method replegarMisiles(){misilesDesplegados = false}
  const property mensajesEmitidos = []
  var property primerMensajeEmitido = mensajesEmitidos.first()
  var property ultimoMensajeEmitido =  mensajesEmitidos.last()
  method emitirMensaje(mensaje){mensajesEmitidos.add(mensaje)}
  method esEscueta(){return !mensajesEmitidos.any({mensajes=>mensajes.size() > 30})}
  override method prepararViaje(){
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(150000)
    self.emitirMensaje("Saliendo en misión")
  }
}
