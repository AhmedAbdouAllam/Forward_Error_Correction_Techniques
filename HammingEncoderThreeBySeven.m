%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
%The name here is a mistake its Four by Seven
function [EncodedMessage] = HammingEncoderThreeBySeven(Message)

G=[0 1 1 1 0 0 0;
    1 0 1 0 1 0 0;
    1 1 0 0 0 1 0;
    1 1 1 0 0 0 1];
lengthOfMessage=length(Message);
lengthOfMesssageExpanded=mod((4-mod(lengthOfMessage,4)),4)+lengthOfMessage;
lengthOfEncodedMessage=lengthOfMesssageExpanded*(7/4);
MessageTruncated = [zeros(1,lengthOfMesssageExpanded-lengthOfMessage),Message];
EncodedMessage=zeros([1 lengthOfEncodedMessage]);
Iterator=lengthOfMesssageExpanded/4;
for i = 1:Iterator
  EncodedMessage(7*(i-1)+1:7*(i-1)+7)=rem(MessageTruncated(4*(i-1)+1:4*(i-1)+4)*G,2);
end



end

