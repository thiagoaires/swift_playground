class Conta{
    var saldo : Double = 0
    var nome: String
    
    init(nome: String){
        self.nome = nome
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    func sacar(_ valor: Double){
        saldo -= valor
    }
}

class ContaPoupanca: Conta{
    var possuiCartaoDebito : Bool
    
    init(possuiCartaoDebito: Bool, nome: String) {
        self.possuiCartaoDebito = possuiCartaoDebito
        super.init(nome: nome)
    }
    
    func solicitarDebito(){
        possuiCartaoDebito = true
        print("O cliente está solicitando cartao debito")
    }
}

var contaPoupanca = ContaPoupanca(possuiCartaoDebito: false, nome: "Thiago")
contaPoupanca.depositar(50)
print(contaPoupanca.saldo)
contaPoupanca.solicitarDebito()


class ContaCorrente: Conta{
    func solicitarEmprestimo(_ valor: Double){
        print("O cliente está solcitando um emprestimo de \(valor)")
        super.depositar(valor)
    }
    
    override func sacar(_ valor: Double){
        saldo -= valor + 5
    }
}

var contaCorrente = ContaCorrente(nome: "Leidy")
contaCorrente.depositar(100)
print(contaCorrente.saldo)
contaCorrente.solicitarEmprestimo(200)
print(contaCorrente.saldo)
contaCorrente.sacar(20)
print(contaCorrente.saldo)
