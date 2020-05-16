% Data 

% Goal is to dissect music recording into 64 spectograms
% Size 192x168

filename = 'esmith1999-03-17t05.wav'

[y,Fs] = audioread(filename);

%nBits = 16;
%sound(y, Fs, nBits);

Y_spec = zeros(192,168,64);


y = y(1000000:(4200000-1),:);

step = floor(length(y(:,1))/64);



start = 1;

nr_sections = 382 %Hamming Window - 192 - nr_sections/2 + 1 %anal_win %nfft

frequencies = nr_sections/2 + 1;

nr_samples = 85 %84.8802 %746 %168 %synth_win

time_bins = (step+1-nr_samples)/(nr_sections-nr_samples)

%s = spectrogram(y(start:start+step,1),nr_sections,nr_samples,nr_sections,Fs,'yaxis');

size(s)

for i = 1:64
    
    
   Y_spec(:,:,i) = spectrogram(y(start:start+step,1),nr_sections,nr_samples,nr_sections,Fs,'yaxis');
    
    start = i*step;
end


%player = audioplayer(y, Fs);
%play(player)
%stop(player)