[y_1, Fs_1] = audioread("sample_1.aif");
[y_2, Fs_2] = audioread("sample_2.aif");
t_1 = (0:length(y_1)-1) / Fs_1;
t_2 = (0:length(y_2)-1) / Fs_2;
figure("Name", "2")
subplot(2,1,1), plot(t_1, y_1(:,1)), title("Sample 1 Time Series"),ylabel("Amplitude"), xlabel("Time(s)"), hold on
subplot(2,1,1), plot(t_1, y_1(:, 2)), legend("Channel 1", "Channel 2"), hold off;
subplot(2,1,2), plot(t_2, y_2(:,1)), title("Sample 2 Time Series"),ylabel("Amplitude"), xlabel("Time(s)"), hold on
subplot(2,1,2), plot(t_2, y_2(:, 2)), legend("Channel 1", "Channel 2"), hold off;
figure("Name","3")
M = 88200;
section_1 = y_1(5000:M+5000, :);
section_2 = y_2(5000:M+5000, :);
spectrum_1 = fft(section_1);
spectrum_2 = fft(section_2);
f = (0:M) * Fs_1 / M;
subplot(2,1,1), plot(f, abs(spectrum_1(:,1))), title("FFT of M = 88200 of Sample 1"), xlim([0 Fs_1/2]), xlabel("Frequency (f)"), ylabel("|X(k)|"), hold on
%subplot(2,1,1), plot(f, abs(spectrum_1(:,2))), legend("Channel 1", "Channel 2"), hold off;
subplot(2,1,2), plot(f, abs(spectrum_2(:,1))), title("FFT of M = 88200 of Sample 2"), xlim([0 Fs_1/2]),xlabel("Frequency (f)"), ylabel("|X(k)|"), hold on;
%subplot(2,1,2), plot(f, abs(spectrum_2(:,2))), legend("Channel 1", "Channel 2"), hold off;
ind = 0;
for f = [441.5 883.5 1767.5]
    ind = ind+1;
    bin_1(ind) = (f*M)/(Fs_1);
end

ind = 0;
for f = [490.5 981.5 736]
    ind = ind+1;
    bin_2(ind) = (f*M)/(Fs_1);
end