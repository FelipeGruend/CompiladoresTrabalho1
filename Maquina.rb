class Maquina

    def initialize
        @pilha = []
    end

    def executa arquivo

        File.open(arquivo).each do |line|
            l = line.split

            case l[0]
            when "PUSH"
                if l[1] == nil
                    puts "Erro"
                    break
                end
                @pilha.push l[1].to_i
            when "SUM"
                a = @pilha.pop
                b = @pilha.pop
                c = a+b
                @pilha.push c
            when "SUB"
                a = @pilha.pop
                b = @pilha.pop
                c = a-b
                @pilha.push c
            when "MULT"
                a = @pilha.pop
                b = @pilha.pop
                c = a*b
                @pilha.push c
            when "DIV"
                a = @pilha.pop
                b = @pilha.pop
                c = a/b
                @pilha.push c
            when "PRINT"
                a = @pilha.pop
                puts a
            else
                puts "erro"
            end

        end

        @pilha = []

    end
    
end

def help
    puts "Você deve digitar o caminho do arquivo. Exemplo: #{__FILE__} codigo.txt" 
end

if ARGV.empty?
    help
    exit
end

maquina = Maquina.new

arquivo = ARGV[0].to_s

maquina.executa arquivo