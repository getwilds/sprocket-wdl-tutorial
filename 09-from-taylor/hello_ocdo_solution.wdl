version 1.0

# Run via Sprocket: sprocket run hello_ocdo_solution.wdl hello_ocdo_inputs.json --output WelcomeToTheOCDOgon

task say_hello_to {
    input {
        String name
    }
    
    command <<<
        echo "Hello ~{name}" > hello_~{name}.txt
    >>>
    
    output {
        File greeting_file = "hello_~{name}.txt"
    }
    
    runtime {
        docker: "ubuntu:20.04"
        memory: "1 GB"
        cpu: 1
    }
}

task count_characters {
    input {
        File greeting_file
        String name
    }
    
    command <<<
        python3 -c "
        with open('~{greeting_file}', 'r') as f:
            content = f.read()
            char_count = len(content)
        with open('count_~{name}.txt', 'w') as out:
            out.write(f'Character count for ~{name}: {char_count}\n')
        "
    >>>
    
    output {
        File count_file = "count_~{name}.txt"
    }
    
    runtime {
        docker: "python:3.9-slim"
        memory: "1 GB"
        cpu: 1
    }
}

workflow hello_names {
    input {
        Array[String] names
    }
    
    scatter (name in names) {
        call say_hello_to {
            input: name = name
        }
        
        call count_characters {
            input: 
                greeting_file = say_hello_to.greeting_file,
                name = name
        }
    }
    
    output {
        Array[File] all_greetings = say_hello_to.greeting_file
        Array[File] all_counts = count_characters.count_file
    }
}


