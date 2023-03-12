@agenda = [{nome: "", telefone: ""}]

def all_contacts
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
        
    end
    puts "-----------------------------------------"
end

def adicionar_contato
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp
    
    novo_contato = nome

    @agenda << {nome: nome, telefone: telefone}
    puts "O contato #{novo_contato} foi adicionado!"
end

def ver_contato
    print "Qual nome você deseja: "
        nome = gets.chomp
    @agenda.each do |contato|
        if contato [:nome].downcase.include?(nome.downcase) 
            puts "#{contato[:nome]} - #{contato[:telefone]}"
        end
    end
    puts "-------------------------------------------"
end

def editar_contato
    print "Qual nome deseja editar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            print "Nome para editar (Se quiser manter o mesmo nome, aperte ENTER): "
            nome_salvo = contato[:nome]
            contato[:nome] = gets.chomp
            
            print "telefone para editar (Se quiser manter o mesmo telefone, aperte ENTER): "
            telefone_salvo = contato[:telefone]
            contato[:telefone] = gets.chomp
           
            alteracao = contato[:nome], contato[:telefone]
            certeza = 's'
            
            puts "Confirma as alterações: #{alteracao} S/n"
           
            confirmacao = gets.chomp

            if confirmacao.downcase == certeza
 
                contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]
                contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
            end
        end
    end
end

def remover_contato
    print "Qual nome deseja remover: "
    nome = gets.chomp
    

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            indice = @agenda.index(contato)
            puts "Tem certeza que deseja remover esse contato? #{contato[:nome]} - #{contato[:telefone]} S/n"
            certeza = 's'
            confirmacao = gets.chomp

            if confirmacao.downcase == certeza
                @agenda.delete_at(indice)
            end
        end
    end
end

loop do
    puts "1. Contatos\n2. Adicionar contato\n3. Ver contato\n4. Editar contato\n5. Remover contato\n0. Sair"
    codigo = gets.chomp.to_i

    case 
        when codigo == 0
            puts "Até mais!"
            break
        
        when codigo == 1
            all_contacts
        
        when codigo == 2
            adicionar_contato

        when codigo == 3
            ver_contato
        when codigo == 4
            editar_contato
        when codigo == 5
            remover_contato
        
    end
end
