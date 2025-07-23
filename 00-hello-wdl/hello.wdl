version 1.0

task hello {

  command { 

    echo "Hello, World!" 
    
  }

}

workflow run_hello {

  call hello

}
