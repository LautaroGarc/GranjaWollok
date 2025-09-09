class Animal {
    var property peso
    var property hambre = false
    var property sed = false
    var property vacunado = false
    var vecesComido = 0

    method nacer() {peso = 1}

    method tieneHambre() = hambre
    method tieneSed() = sed

    method comer(cantidadAlimento) {peso += cantidadAlimento/2}

    method beberAgua() {
        if (sed) {
            peso = peso -1
            sed = false
        }
    }
    
    method vacunar() {
        if (!vacunado) {
            vacunado = true
        }
    }

    method getEstado() = "Peso: " + peso + " - Hambre: " + hambre + " - Sed: " + sed + " - Vacunado: " + vacunado
}

class Vaca inherits Animal {
    override method nacer() {peso = 50}
}

class Cerdo inherits Animal {
    override method nacer() {peso = 30}
}

class Gallina inherits Animal {
    override method nacer() {peso = 4}
}

class Rancho {

}