%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
%This Function is used in the GUI

function [SNRe,BER] = MainSimulator(SNR_Begin,SNR_End,ChannelSelect,FECSelect,Fair,No_of_sent_bits)

Step=(SNR_End-SNR_Begin)/10;
SNRe=SNR_Begin:Step:SNR_End;
BER=zeros([1 length(SNRe)]);
for i=1:length(SNRe)
   for k=1:20
    RealizationError=Realization(SNRe(i),ChannelSelect,FECSelect,Fair,No_of_sent_bits);
    BER(i)=BER(i)+RealizationError;
   end
   BER(i)=BER(i)/20;
end

end

