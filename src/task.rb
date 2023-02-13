class Task
    @name =''
    @state =''
    @task = {
        name: '',
        state:''
    }

    def create(name, state)
        @name = name
        @state = state
        @task = {
            name: @name,
            state: @state
        }

        $manager.append(@task)
    end

    def show
        $manager
    end

    def show_by_name(name)
        _task = $manager.select do |task|
            task[:name] == name
        end
        _task
    end

    def update(name)
        @task = show_by_name(name)
        puts "Ingrese el nuevo nombre: "
        @name = gets.chomp
        @task[0][:name] = @name
    end

    def mark_as_in_process(name)
        $manager.each do |task|
            if (task[:name] == name)
                task[:state] = 1
            end
        end
    end

    def mark_as_done(name)
        $manager.each do |task|
            if (task[:name] == name)
                task[:state] = 2
            end
        end
    end

    def get_all_created
        _created = []
        $manager.each do |task|
            _created.append(task) if task[:state] == 0
        end
        _created
    end

    def get_all_in_process
        _in_process = []
        $manager.each do |task|
            _in_process.append(task) if task[:state] ==1
        end
        _in_process
    end

    def get_all_done
        _done = []
        $manager.each do |task|
            _done.append(task) if task[:state] ==2
        end
        _done
    end
end