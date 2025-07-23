version 1.0

## TODO: Complete this task to greet a specific person
task say_hello_to {
    input {
        # TODO: Add a String input parameter for the person's name
    }
    
    command <<<
        # TODO: Echo "Hello {name}" to a file
        # Hint: Use ~{name} to substitute the input variable
        # Save to a file called "hello_{name}.txt"
    >>>
    
    output {
        # TODO: Return the greeting file
        # The filename should include the person's name
    }
    
    runtime {
        docker: "ubuntu:20.04"
        memory: "1 GB" 
        cpu: 1
    }
}

## TODO: Complete this task to count characters in a greeting file using Python
task count_characters {
    input {
        File greeting_file
        String name
    }
    
    command <<<
        # Write a small Python script that reads the file and counts characters
        # Save the result to a file called "count_{name}.txt"
        python3 -c "
        with open('~{greeting_file}', 'r') as f:
            content = f.read()
            char_count = len(content)
        with open('count_~{name}.txt', 'w') as out:
            out.write(f'Character count for ~{name}: {char_count}\n')
        "
    >>>
    
    output {
        # TODO: Return the character count file
    }
    
    runtime {
        docker: "python:3.9-slim"
        memory: "1 GB"
        cpu: 1
    }
}

workflow hello_names {
    input {
        # TODO: Add an Array[String] input for the list of names
    }
    
    # TODO: Use scatter to call say_hello_to for each name in the array
    
    # TODO: Use scatter to call count_characters for each greeting file
    # Hint: You'll need to pass both the greeting file AND the name
    
    output {
        # TODO: Return both the greeting files and the character count files
        # Two separate Array[File] outputs
    }
}


