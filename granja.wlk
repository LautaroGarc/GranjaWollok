class Animal {
    var property peso
    var property vacunado = false
    var cantComida = 0

    method nacer() {peso = 1}

    method comer(cantAlimento) {
        peso += 0
        cantComida += 1    
    }

    method beber() {peso += 0}
    
    method caminar() {peso += -1}

    method vacunar() {
        if (!vacunado) {
            vacunado = true
            return vacunado
        }
        return !vacunado
    }
}

class Vaca inherits Animal {
    var property hambre = peso < 400
    var property sed = false

    override method nacer() {peso = 50}

    override method comer(cantAlimento) {
        peso += cantAlimento / 2
        sed = true
        cantComida += 1
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
    var property hambre = peso < 200
    var property sed = cantComida >= 3

    override method nacer() {peso = 30}

    override method beber() {
        cantComida = 0
        peso += -1
    }
    override method comer(cantAlimento) {
        peso += cantAlimento / 2
        cantComida += 1
    }

    override method caminar() {peso += -3}

    override method vacunar() {
        vacunado = true
        return true    
    }
}

class Gallina inherits Animal {
    var property hambre = true
    var property sed = false

    override method nacer() {peso = 4}

    override method vacunar() = vacunado
}

class Rancho {

}