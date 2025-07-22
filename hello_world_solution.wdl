version 1.0

# Run via Sprocket: sprocket run hello_world_solution.wdl

task say_hello {
    input {} # No inputs necessary for now
    
    command <<<
        echo "Hello World" > hello.txt
    >>>
    
    output {
        File hello_file = "hello.txt"
    }
    
    runtime {
        docker: "ubuntu:20.04"
        memory: "1 GB"
        cpu: 1
    }
}

workflow hello_world {
    call say_hello
    
    output {
        File greeting = say_hello.hello_file
    }
}


