class Animal {
    var property peso = 0
    var property vacunado = false
    var property enfermo = false
    var property muerto = false
    var nivelHambre = 0
    var nivelSed = 0
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
    const property especie = 'vaca'
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
    const property especie = 'cerdo'
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
    const property especie = 'gallina'
    var property hambre = true
    var property sed = false

    override method nacer() {peso = 4}

    override method vacunar() = vacunado
}

class Rancho {
    const rancho = []
    var tiempo = 0

    method crearVaca() {
        const vaca = new Vaca()
        vaca.nacer()
        rancho.add(vaca)
    }

    method crearCerdo() {
        const cerdo = new Cerdo()
        cerdo.nacer()
        rancho.add(cerdo)
    }

    method crearGallina() {
        const gallina = new Gallina()
        gallina.nacer()
        rancho.add(new Gallina())
    }

    method animalAleatorio() {
        return rancho.get(0.randomUpTo(rancho.size() -1).floor())
    }

    method cruzarAnimales(Animal1, Animal2) {

    }

    method tienenHambre() {
        rancho.forEach({ animal => animal.hambre() })
    }

    method tienenSed() {
        rancho.forEach({ animal => animal.sed() })
    }

    method estaEnfermo() {
        rancho.forEach({ animal => animal.enfermo() })
    }

    method alimentarAnimales(cantidadAlimento) {
        rancho.forEach({ animal => animal.comer(cantidadAlimento) })
    }

    method beberAnimales() {
        rancho.forEach({ animal => animal.beber() })
    }

    method vacunarAnimales() {
        rancho.forEach({ animal => animal.vacunar() })
    }

    method caminarAnimales() {
        rancho.forEach({ animal => animal.caminar() })
    }

    method enfermarAnimales() {
        rancho.forEach({ animal => animal.enfermo(true) })
    }

    method enfermar(indiceAnimal){
        rancho[indiceAnimal].enfermo(true)
    }

    method avanzarTiempo() {
        rancho.forEach({animal =>
            if (animal.estaEnfermo()) {
                if (0.randomUpTo(4).floor() == 1) {
                    console.println('un/a '+ animal.especie() +' murió')
                    animal.muerto(true)
                }
            }

            animal.nivelHambre(animal.nivelHambre() + 1)
            animal.nivelSed(animal.nivelSed() + 1)

            if (animal.nivelHambre() > 5 || animal.nivelSed() > 5) {
                console.println('un/a '+ animal.especie() +' murió')
                animal.muerto(true)
            }
        })

        rancho.filter({animal => !animal.muerto()})
    }
}