library ieee;
use ieee.std_logic_1164.all;

entity seventh is
  port
  (
    DIN : in std_logic_vector(3 downto 0);
    XORER : in std_logic_vector (7 downto 0);
    DOUT : out std_logic_vector(3 downto 0);
    ONE_ERR : out std_logic;
    DBL_ERR : out std_logic;
    CODED : out std_logic_vector(7 downto 0);
    AFTER_XOR : out std_logic_vector(7 downto 0)
  );
end seventh;

architecture structural of seventh is
  signal coderOut : std_logic_vector(7 downto 0);
  signal decoderInput : std_logic_vector(7 downto 0);
  
  component CODER
    port
    (
      D : in std_logic_vector (3 downto 0);
      output : out std_logic_vector (7 downto 0)
    );
  end component;
  
  component DECODER
    port
    (
      input : in std_logic_vector (7 downto 0);
      D : out std_logic_vector (3 downto 0);
      ONE_ERR : out std_logic;
      DBL_ERR : out std_logic
    );
  end component;

begin
  CODER_INST : CODER
    port map(
      D => DIN,
      output => coderOut
    );
    
  decoderInput(0) <= coderOut(0) xor XORER(0);
  decoderInput(1) <= coderOut(1) xor XORER(1);
  decoderInput(2) <= coderOut(2) xor XORER(2);
  decoderInput(3) <= coderOut(3) xor XORER(3);
  decoderInput(4) <= coderOut(4) xor XORER(4);
  decoderInput(5) <= coderOut(5) xor XORER(5);
  decoderInput(6) <= coderOut(6) xor XORER(6);
  decoderInput(7) <= coderOut(7) xor XORER(7);
    
  DECODER_INST : DECODER
    port map(
      input => decoderInput,
      D => DOUT,
      ONE_ERR => ONE_ERR,
      DBL_ERR => DBL_ERR
    );
    
  CODED <= coderOut;
  AFTER_XOR <= decoderInput;
  
end structural;
