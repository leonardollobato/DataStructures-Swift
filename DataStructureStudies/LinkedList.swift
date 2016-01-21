//
//  LinkedList.swift
//  HelloWorld
//
//  Created by Leonardo Lobato on 1/19/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import Foundation

public class LinkedList{
    
    // Primeiro Node da Lista
    private var header:Node
    
    // Último Node da Lista
    private var tail:Node
    
    // Número de Nodes Na Lista
    private var size:Int = 0
    
    // Ao Criar A Lista, Atribui um Node Vazio ao Header e Tail
    init(){
        self.header = Node(value: nil)
        self.tail = header
    }
    
    // Adiciona um Node ao Ínicio da Lista
    func prepend(newValue:Int)->Void{
        
        // Cria novo node com o valor informado
        let newNode = Node(value: newValue)
        
        // Verifica se o tamanho da lista é 0, caso seja, significa que é o primeiro item a ser adicionado
        // Nesse caso entra no if...
        if(self.size == 0){
            self.firstItemAddedToList(newNode)
        }else{
            // Guarda a referência atual do próximo Node do atual header
            let tempNode = self.header.next
            // configura a referência de próximo node para o node atual
            self.header.next = newNode
            // configura a referência de próximo node do novo node para guardada na variável temporária
            newNode.next = tempNode
            // adiciona um ao contador de nodes
            self.size++
        }
    }
    
    func append(newValue:Int)->Void{
        // Cria novo node com o valor informado
        let newNode = Node(value: newValue)
        
        // Verifica se o tamanho da lista é 0, caso seja, significa que é o primeiro item a ser adicionado
        // Nesse caso entra no if...
        if(self.size == 0){
            self.firstItemAddedToList(newNode)
        }else{
            // a atual variável self.tail será a penúltima, assim que o novo node for adicionado
            // sendo assim, é preciso configurar a referência do penúltimo node apontando para o último
            self.tail.next = newNode
            // configura o tail para ser o novo Node
            self.tail = newNode
            self.size++
        }
    }
    
    private func firstItemAddedToList(node:Node){
        // Adiciona o novo Node criado com o valor informado, à propriedade Next do atual HEADER
        self.header.next = node
        // Adiciona o novo Node criado ao TAIL, ou seja, o novo node é o último e primeiro da lista neste caso
        self.tail = node
        // Adicionar 1 ao contador de nodes da lista
        self.size++;
    }
    
    func removeFirst()->Void{
        // verifica se existe item para ser removido
        if(self.size != 0){
            // configura o valor next do atual header, para o valor do next do node que esta atualmente atrelado ao header.net
            self.header.next = self.header.next!.next!
            self.size--;
        }
    }
    
    func removeLast()->Void{
        // verifica se existe somente um item
        if(self.size == 1){
            // remove a referencia da propriedade next
            self.header.next = nil
            // e configura o tail como sendo o próprio header
            self.tail = self.header
            self.size--;
            
            //verifica se há item na lista
        } else if self.size != 0 {
            
            // configura esta variável para o node que atualmente é apontado como next do header
            var node = self.header.next
            var count = 1
            
            // para pegar o penultimo node, é feito essa condicional
            // enquanto count for diferente da condicional
            while count != (self.size - 1) {
                // a variável node assume o valor next do node atualmente na interação
                node = node!.next
                count++
            }
            
            // o valor do penultimo node é atribuido a self.tail
            self.tail = node!
            // a referencia ao ultimo node é removida, logo o ultimo node
            self.tail.next = nil
            self.size--;
            
        }
    }
    
    func removeAt(index:Int){
        if (index <= 0) || (index > self.size){
            return
        }else if index == 1{
            // já existe um método para isto
            removeFirst()
            //verifica se é para inserrir na última posição
        }else if index == self.size{
            // já existe um método para isto
            removeLast()
        }else{
            
            var node = self.header.next!
            var count = 1
            
            while count != (index - 1){
                node = node.next!
                count++
            }
            
            node.next = node.next!.next!
            size--;
        }
    }
    
    
    func insertAt(index:Int, newValue:Int)->Void{
        
        // Verifica se o index é menor que zero ou maior que o tamanho da lista
        if (index <= 0) || (index > self.size){
            //caso seja, retorna sem fazer nada
            return
            // verifica se é para inserir na primeira posição
        }else if index == 1{
            // já existe um método para isto
            prepend(newValue)
            //verifica se é para inserrir na última posição
        }else if index == self.size{
            // já existe um método para isto
            append(newValue)
        }else{
            // cria um novo node com o valor informado
            let newNode = Node(value: newValue)
            // cria um node com o primeiro node
            var node = self.header.next!
            var count = 1
            
            // interage ate que count seja igual a index-1 - significa a posicao do node antes da posicao a 
            // ser inserido o novo node
            while count != (index - 1){
                // enquanto a intereção não é false, vai passando para o próximo node até encontrar o anterior a posição a ser
                // adicionado
                node = node.next!
                count++
            }
            
            // guarda o atual node presente na propriedade next do node que esta posterior a posição desejada para a adicao
            // do novo node, para uso posterior
            let tempNode = node.next
            // configura a propriedade next do node posterior para apontar para o novo node
            node.next = newNode
            // configura a propriedade next do novo node para apontar para o node presente na variável tempNode
            newNode.next = tempNode
            size++
            
        }
    }
    
    func getSize()->Int{
        return self.size
    }
    
    func toString()->String{
        //pega o primeiro node
        var node = self.header.next
        var temp:String = ""
        
        //enquanto houver node, a intereção continua
        while node != nil{
            // o node da atual intereção é concatenado(valor) à string
            temp += "\((node?.value)!) | "
            // é atribuido ao valor da variável node a próxima referencia node
            node = node?.next
        }
        
        return temp
    }
    
}
