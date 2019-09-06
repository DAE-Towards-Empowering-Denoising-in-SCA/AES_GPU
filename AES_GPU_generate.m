%% This script generates AES_GPU dataset. The leakage position is the 1st byte in AES-128 last round. 

% original AES-128 key FC367E0919BEF302E43D24AC1EF03CDE
% 11 round subkey 13A3E7164F5EAD8285AEE05A49B69AF1

clear;

load('Sbox_inv.mat');
key = {'13' 'A3' 'E7' '16' '4F' '5E' 'AD' '82' '85' 'AE' 'E0' '5A' '49' 'B6' '9A' 'F1'};
key = hex2dec(key);
shiftrow = [1,6,11,16,5,10,15,4,9,14,3,8,13,2,7,12];

trace = h5read('GPU_raw_traces.h5','/trace');
cipher = h5read('GPU_raw_traces.h5','/cipher');

attackByte = 1;
v = bitxor( cipher(:,shiftrow(attackByte)), key(shiftrow(attackByte)));
v = Sbox_inv( v + 1 )';

% 350 points from [10600:10949] are extracted.
trace = trace(:,10600:10949);
key = key(attackByte);
cipher = cipher(:,attackByte);

save('AES_GPU.mat','trace','v','key','cipher');