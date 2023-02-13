require './src/login.rb'

class Main
    def main 
        #instanciar
        login = Login.new
        login.user_exists?
    end
end

main = Main.new
main.main