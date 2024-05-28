def calculate_parity_bits(m):
    p = 0
    while (2 ** p) < m + p + 1:
        p += 1
    return p

def position_parity_bits(data, p):
    j = 0
    k = 1
    m = len(data)
    result = ''
    for i in range(1, m + p + 1):
        if i == 2 ** j:
            result += '0'
            j += 1
        else:
            result += data[-k]
            k += 1
    return result[::-1]

def calculate_parity_values(code, p):
    n = len(code)
    for i in range(p):
        val = 0
        for j in range(1, n + 1):
            if j & (2 ** i) == (2 ** i):
                val = val ^ int(code[-j])
        code = code[:n-(2**i)] + str(val) + code[n-(2**i)+1:]
    return code

def detect_correct_error(code, p):
    n = len(code)
    error_pos = 0
    for i in range(p):
        val = 0
        for j in range(1, n + 1):
            if j & (2 ** i) == (2 ** i):
                val = val ^ int(code[-j])
        error_pos += val * (2 ** i)
    if error_pos:
        print(f"Error found at position: {error_pos}")
        corrected_code = code[:n - error_pos] + str(1 - int(code[n - error_pos])) + code[n - error_pos + 1:]
        return corrected_code
    else:
        print("No error detected.")
        return code
def main():
    original_data = input("Enter the data bits: ")
    m = len(original_data)
    p = calculate_parity_bits(m)
    positioned_data = position_parity_bits(original_data, p)
    hamming_code = calculate_parity_values(positioned_data, p)
    print(f"Hamming Code: {hamming_code}")
    received_code = input("Enter the received Hamming Code: ")
    corrected_code = detect_correct_error(received_code, p)
    print(f"Corrected Hamming Code: {corrected_code}")
main()