version 1.0

task word_count {
    input {
        File input_file
    }

    command <<<
        wc -w < ~{input_file} > wordcount.txt
    >>>

    output {
        Int count = read_int("wordcount.txt")
        String filename = basename("~{input_file}")
    }

    runtime {
        docker: "ubuntu:20.04"
    }
}

task write_tsv {
    input {
        Array[String] filenames
        Array[Int] counts
        File script
    }

    command <<<
        python3 ~{script} ~{write_json(filenames)} ~{write_json(counts)}
    >>>

    output {
        File tsv = "word_counts.tsv"
    }

    runtime {
        docker: "python:3.10-slim"
    }
}

workflow count_words_batch {
    input {
        Array[File] input_files
        File script
    }

    scatter (f in input_files) {
        call word_count { input: input_file = f }
    }

    call write_tsv { input:
        filenames = word_count.filename,
        counts = word_count.count,
        script = script,
    }

    output {
        File summary = write_tsv.tsv
    }
}
