#!/bin/bash

cd ~
mkdir picogbcart
cd picogbcart 
git clone https://github.com/0xen/PICO-GB-CART
mv ~/picogbcart/PICO-GB-CART/third_party/gbdk  ~/picogbcart/PICO-GB-CART/third_party/gbdk-win 
git clone https://github.com/gbdk-2020/gbdk-2020
mv gbdk-2020 gbdk

cd ../Roms
mkdir tmp
cd tmp



curl -o drmario.7z https://dl2.emu-land.net/roms/gbx/Dr.%20Mario.7z 
curl -o tetris.7z https://dl2.emu-land.net/roms/gbx/Tetris.7z
curl -o zelda.7z "https://dl2.emu-land.net/roms/gbx/Legend%20of%20Zelda,%20The%20-%20Link's%20Awakening.7z"
curl -o alleyway.7z https://dl2.emu-land.net/roms/gbx/Alleyway.7z
curl -o supermarioland.7z https://dl2.emu-land.net/roms/gbx/Super%20Mario%20Land.7z
curl -o yoshi.7z https://dl2.emu-land.net/roms/gbx/Yoshi.7z
curl -o allstarchallenge2.7z https://dl2.emu-land.net/roms/gbx/NBA%20All%20Star%20Challenge%202.7z
tar xJf drmario.7z
tar xJf tetris.7z
tar xJf zelda.7z
tar xJf alleyway.7z
tar xJf supermarioland.7z
tar xJf yoshi.7z
tar xJf allstarchallenge2.7z
mv Alleyway\ \(JUE\)\ \[\!\].gb ../ALLEYWAY.gb
mv Dr.\ Mario\ \(JU\)\ \(V1.0\)\ \[\!\].gb ../DRMARIO.gb 
mv Legend\ of\ Zelda\,\ The\ -\ Link\'s\ Awakening\ \(G\)\ \[\!\].gb ../ZELDA.gb 
mv Mario\ \&\ Yoshi\ \(E\)\ \[\!\].gb ../MARIOANDYOSHI.gb 
mv NBA\ All\ Star\ Challenge\ 2\ \(U\)\ \[\!\].gb ../ALSTARCHALLENGE2.gb 
mv Super\ Mario\ Land\ \(JUE\)\ \(V1.0\)\ \[\!\].gb ../SUPERMARIOLAND.gb 
mv Tetris\ \(JUE\)\ \(V1.0\)\ \[\!\].gb ../TETRIS.gb 
cd ..
python3 ../Python/bin2c.py ./ALLEYWAY.gb ALLEYWAYCode >"./ALLEYWAY.c"
python3 ../Python/bin2c.py ./DRMARIO.gb DRMARIOCode >"./DRMARIO.c"
python3 ../Python/bin2c.py ./ZELDA.gb ZELDACode >"./ZELDA.c"
python3 ../Python/bin2c.py ./MARIOANDYOSHI.gb MARIOANDYOSHICode >"./MARIOANDYOSHI.c"
python3 ../Python/bin2c.py ./ALSTARCHALLENGE2.gb ALSTARCHALLENGE2Code >"./ALSTARCHALLENGE2.c"
python3 ../Python/bin2c.py ./SUPERMARIOLAND.gb SUPERMARIOLANDCode >"./SUPERMARIOLAND.c"
python3 ../Python/bin2c.py ./TETRIS.gb TETRISCode >"./TETRIS.c"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/qontrol/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

cd ..
git clone https://github.com/raspberrypi/pico-extras
cd PICO-GB-CART

sed -i -e "s%F:/Downloads/pico-extras-master/pico-extras-master%~/picogbcart/pico-extras%g" CMakeLists.txt 
cmake -H. -Bbuild --log-level=NOTICE -G "Unix Makefiles"
