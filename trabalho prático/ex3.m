%Initialization
clear, close all, clc;

%add paths
addpath ./1
addpath ./2
addpath ./3/data

%load info
kid_img = imread('kid.bmp');
homer_img = imread('homer.bmp');
homerBin_img= imread('homerBin.bmp');
[guitarSolo_audio, fs] = audioread('guitarSolo.wav');
english_txt = fileread('english.txt');
english_txt(regexp(english_txt, '[^a-zA-Z]')) = [];
english_txt(size(english_txt,2)) = [];

%alphabets
image_alphabet = (0:255);

audio_info = audioinfo('guitarSolo.wav');
d = 2/2^audio_info.BitsPerSample;
audio_alphabet = (-1:d:1-d);

text_alphabet = ['A':'Z', 'a':'z'];


%graphs
disp(sprintf('Exercise 3:'));
subplot(2,3,1)
symbols_frequency(kid_img, image_alphabet);
title('kid.bmp');

subplot(2,3,2)
symbols_frequency(homer_img, image_alphabet);
title('homer.bmp');

subplot(2,3,3)
symbols_frequency(homerBin_img, image_alphabet);
title('homerBin.bmp');

subplot(2,3,4)
symbols_frequency(guitarSolo_audio, audio_alphabet);
title('guitarSolo.wav');

subplot(2,3,5)
symbols_frequency(double(english_txt), double(text_alphabet));
set(gca, 'XTickLabel', cellstr(num2str(text_alphabet'))', 'XTick', 1:numel(text_alphabet));
title('english.txt');

%entropies
disp(sprintf('Entropies:'));

disp(sprintf('kid.bmp --> %f', calc_entropy(kid_img)));

disp(sprintf('homer.bmp --> %f', calc_entropy(homer_img)));

disp(sprintf('homerbin.bmp --> %f', calc_entropy(homerBin_img)));

disp(sprintf('guitarSolo.wav --> %f', calc_entropy(guitarSolo_audio)));

disp(sprintf('english.txt --> %f', calc_entropy(double(english_txt))));

