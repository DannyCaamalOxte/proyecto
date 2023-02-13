require './src/task.rb'
require './src/archive.rb'

class Manager
    $manager = []

    def initialize
        @task = Task.new
        @archive = Archive.new
        $manager = @archive.read_file_tasks
    end

    def initialize_file
        if (!@archive.file_exists?('./dist/tasks.txt'))
            $manager = ''
            @archive.create_file_tasks
            else
                $manager = @archive.read_file_tasks
        end
    end

    def create_task
        puts "nombre de la tarea: "
        _name = gets.chomp
        @task.create(_name, 0)
        @archive.write_file_tasks
        gets
    end

    def get_tasks
        puts @task.show
        gets
    end

    def get_task_by_name
        puts "Ingrese el nombre de la tarea: "
        name = gets.chomp
        puts @task.show_by_name(name)
        gets
    end

    def update_task
        puts = "Ingrese el nombre de la tarea: "
        name = gets.chomp
        @task.update(name)
        @archive.write_file_tasks
        gets
    end

    def mark_as_in_process
        puts "Ingrese el nombre de la tarea a iniciar: "
        name = gets.chomp
        @task.mark_as_in_process(name)
        @archive.write_file_tasks
        gets
    end

    def mark_as_done
        puts "Ingrese el nombre de la tarea a finalizar: "
        name = gets.chomp
        @task.mark_as_done(name)
        @archive.write_file_tasks
        gets
    end

    def get_all_created
        @task.get_all_created
        gets
    end

    def get_all_in_process
        @task.get_all_in_process
        gets
    end

    def get_all_done
        @task.get_all_done
        gets
    end

    def menu
        op = 0
        while (op != 10)
            system 'clear'
            puts "1. Crear tarea"
            puts "2. Listar todas las tareas"
            puts "3. Buscar tarea por nombre"
            puts "4. Editar tarea"
            puts "5. Marcar como en proceso"
            puts "6. Marcar como terminada"
            puts "7. Ver todas las tareas creadas"
            puts "8. Ver todas las tareas en proceso"
            puts "9. Ver todas las tareas finalizadas"
            puts "10. Salir"
            op = gets.to_i
            case op
            when 1
                system 'clear'
                create_task
            when 2
                system 'clear'
                get_tasks
            when 3
                system 'clear'
                get_task_by_name
            when 4
                system 'clear'
                update_task
            when 5
                system 'clear'
                mark_as_in_process
            when 6
                system 'clear'
                mark_as_done
            when 7
                system 'clear'
                get_all_created
            when 8
                system 'clear'
                get_all_in_process
            when 9
                system 'clear'
                get_all_done
            end

        end
    end

end