connect

# Get all available targets
targets -set -filter {name =~ "ARM Cortex-A9 MPCore #0"}
set boards [targets -filter {name =~ "*PS7*"}]

# Path to your ELF file
set elf_path "C:/Users/PatrickKenis/AudioProccesing/LAB2_Delay/Taak1/Taak1app/Taak1app.elf"

foreach b $boards {
    puts "Programming board: $b"
    targets -set -nocase -filter "name==$b"
    stop
    rst -processor
    dow $elf_path
    con
}
