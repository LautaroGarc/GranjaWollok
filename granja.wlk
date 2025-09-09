class Animal {
    var property peso
    var property vacunado = false
    var cantComida = 0
    var sed = true
    var hambre = true

    method nacer() {peso = 1}

    method tieneHambre() = hambre

    method tieneSed() = sed

    method comer(cantAlimento) {peso += cantAlimento/2}

    method beber() {
        peso = peso -1
    }
    
    method caminar() {peso += -1}

    method vacunar() {
        if (!vacunado) {
            vacunado = true
            return vacunado
        }
        return !vacunado
    }

    method getEstado() = "Peso: " + peso + " - Hambre: " + hambre + " - Sed: " + sed + " - Vacunado: " + vacunado
}

class Vaca inherits Animal {
    override method nacer() {peso = 50}

    override method comer(cantAlimento) {
        peso += cantAlimento / 2
        sed = true
        cantComida += 1
        if (peso > 400) {hambre = false}
    }
    override method beber() {
        peso += -1
        sed = false
    }

    override method caminar() {peso += -3}

    override method vacunar() {
        if (!vacunado) {
            vacunado = true
            return vacunado
        }
        return !vacunado
    }
}

class Cerdo inherits Animal {
    override method nacer() {peso = 30}

    override method beber() {
        sed = false
        peso += -1
    }
    override method comer(cantAlimento) {
        peso += cantAlimento / 2
        if (cantComida >= 3) {
            sed = true
        }
    }

    override method caminar() {peso += -3}

    override method vacunar() {
        if (!vacunado) {
            vacunado = true
            return vacunado
        }
        return !vacunado
    }
}

class Gallina inherits Animal {
    override method nacer() {peso = 4}

    override method vacunar() = vacunado
}

class Rancho {

}