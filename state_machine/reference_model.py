import os

def generate_reference_model():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    input_file = os.path.join(script_dir, "simulate_test.txt")
    output_file = os.path.join(script_dir, "reference_model_test.txt")

    try:
        with open(input_file, "r") as f_in, open(output_file, "w") as f_out:
            text = f_in.read(16)
            
            for char in text:
                ascii_val = ord(char)
                
                bin_str = format(ascii_val, '08b')
                
                bin_reversed = bin_str[::-1]
                
                frame = '0' + '1' + bin_reversed + '0' + '0'
                
                f_out.write(frame)
                
        print(f"Result has been written in: {output_file}")
        
    except FileNotFoundError:
        print(f"Error. No such file: {input_file}.")

if __name__ == "__main__":
    generate_reference_model()