# Twój program w Asemblerze (z poprawnymi adresami)
asm_kod = [
    # Krok 1: Zapal LED0 i potężna pętla opóźniająca (~1 sekunda)
    "movi R4, 1",        # 0
    "movi R0, 5",        # 1  (zewnętrzny mnożnik)
    "movi R1, 255",      # 2
    "movi R2, 255",      # 3
    "movi R3, 255",      # 4  (najgłębszy licznik)
    "add R3, R3, 255",   # 5  (R3 = R3 - 1)
    "jnz R3, 5",         # 6  (kręć R3)
    "add R2, R2, 255",   # 7  (R2 = R2 - 1)
    "jnz R2, 4",         # 8  (kręć R2, odnów R3)
    "add R1, R1, 255",   # 9  (R1 = R1 - 1)
    "jnz R1, 3",         # 10 (kręć R1, odnów R2)
    "add R0, R0, 255",   # 11 (R0 = R0 - 1)
    "jnz R0, 2",         # 12 (kręć R0, odnów R1)

    # Krok 2: Czekaj na SW0 i zapal LED1
    "movi R4, 2",        # 13
    "movi R1, 1",        # 14 (maska dla SW0)
    "and R2, R5, R1",    # 15 (czytaj z GPI)
    "jz R2, 15",         # 16 (zawieszenie, aż SW0 będzie w górze)

    # Krok 3: Zapal LED2 i znów czekaj ~1 sekundę
    "movi R4, 4",        # 17
    "movi R0, 5",        # 18
    "movi R1, 255",      # 19
    "movi R2, 255",      # 20
    "movi R3, 255",      # 21
    "add R3, R3, 255",   # 22
    "jnz R3, 22",        # 23
    "add R2, R2, 255",   # 24
    "jnz R2, 21",        # 25
    "add R1, R1, 255",   # 26
    "jnz R1, 20",        # 27
    "add R0, R0, 255",   # 28
    "jnz R0, 19",        # 29

    # Krok 4: Czekaj na SW1 i zapal LED3
    "movi R4, 8",        # 30
    "movi R1, 2",        # 31 (maska dla SW1)
    "and R2, R5, R1",    # 32 (czytaj z GPI)
    "jz R2, 32",         # 33 (zawieszenie, aż SW1 będzie w górze)

    # Krok 5: Wróć na start
    "jump 0"             # 34
]

def kompiluj_instrukcje(linia, adres_linii):
    pc_op = "00"
    alu_op = "00"
    rx_op = "000"
    imm_op = "0"
    ry_op = "000"
    rd_op = "0"
    d_op = "000"
    imm = "00000000"

    czesci = linia.replace(",", "").split()
    cmd = czesci[0].lower()

    # Pomocnicza funkcja: zamienia "R4" na "100" (binarnie)
    def reg_bin(r_str):
        return format(int(r_str.replace("R", "").replace("r", "")), '03b')

    if cmd == "movi":  # movi Rx, imm 
        pc_op, alu_op, rx_op, imm_op = "00", "01", "110", "1"
        d_op = reg_bin(czesci[1])
        imm = format(int(czesci[2]), '08b')

    elif cmd == "add": # add Rx, Ry, imm
        pc_op, alu_op, imm_op = "00", "01", "1"
        d_op = reg_bin(czesci[1])
        rx_op = reg_bin(czesci[2])
        imm = format(int(czesci[3]), '08b')

    elif cmd == "and": # and Rx, Ry, Rz
        pc_op, alu_op, imm_op = "00", "00", "0"
        d_op = reg_bin(czesci[1])
        rx_op = reg_bin(czesci[2])
        ry_op = reg_bin(czesci[3])

    elif cmd == "jz":  # jz Rx, adres
        pc_op, alu_op, imm_op, d_op = "11", "11", "1", "111" # 111 w d_op chroni rejestry
        rx_op = reg_bin(czesci[1])
        imm = format(int(czesci[2]), '08b')

    elif cmd == "jnz": # jnz Rx, adres
        pc_op, alu_op, imm_op, d_op = "10", "11", "1", "111"
        rx_op = reg_bin(czesci[1])
        imm = format(int(czesci[2]), '08b')

    elif cmd == "jump": # jump adres
        pc_op, alu_op, imm_op, d_op = "01", "11", "1", "111"
        imm = format(int(czesci[1]), '08b')

    maszynowy = f"000000_{pc_op}_00_{alu_op}_0_{rx_op}_{imm_op}_{ry_op}_{rd_op}_{d_op}_{imm}"
    return f"assign program[{adres_linii}] = 32'b{maszynowy}; // {adres_linii}: {linia}"

for i, instrukcja in enumerate(asm_kod):
    print(kompiluj_instrukcje(instrukcja, i))