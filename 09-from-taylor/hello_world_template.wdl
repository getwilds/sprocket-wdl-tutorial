version 1.0

## TODO: Complete this task to create a "Hello World" message
task say_hello {
    input {} # No inputs necessary for now
    
    command <<<
        # TODO: Use echo to write "Hello World" to a file called hello.txt
    >>>
    
    output {
        # TODO: Return the hello.txt file as output
    }
    
    runtime {
        docker: "ubuntu:20.04"
        memory: "1 GB"
        cpu: 1
    }
}

workflow hello_world {
    # TODO: Call the say_hello task
    
    output {
        # TODO: Return the hello file from the task
    }
}


