version 1.0

task word_count {
    input {
        File input_file
    }

    command <<<
        wc -w < ~{input_file} > wordcount.txt
    >>>

    output {
        Int word_count = read_int("wordcount.txt")
    }

    runtime {
        docker: "ubuntu:20.04"
    }
}

workflow count_words_workflow {
    input {
        File input_file
    }

    call word_count { input: input_file = input_file }

    output {
        Int total_words = word_count.word_count
    }
}
