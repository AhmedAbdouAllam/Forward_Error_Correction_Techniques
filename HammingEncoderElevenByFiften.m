%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [EncodedMessage] = HammingEncoderElevenByFiften(Message)

    G = [1     1     0     0     1     0     0     0     0     0     0     0     0     0     0     ;
         1     0     1     0     0     1     0     0     0     0     0     0     0     0     0     ;
         1     0     0     1     0     0     1     0     0     0     0     0     0     0     0     ;
         0     1     1     0     0     0     0     1     0     0     0     0     0     0     0     ;
         0     1     0     1     0     0     0     0     1     0     0     0     0     0     0    ;
         0     0     1     1     0     0     0     0     0     1     0     0     0     0     0     ;
         1     1     1     0     0     0     0     0     0     0     1     0     0     0     0     ;
         1     1     0     1     0     0     0     0     0     0     0     1     0     0     0     ;
         1     0     1     1     0     0     0     0     0     0     0     0     1     0     0    ;
         0     1     1     1     0     0     0     0     0     0     0     0     0     1     0     ;
         1     1     1     1     0     0     0     0     0     0     0     0     0     0     1     ];
lengthOfMessage=length(Message);
lengthOfMesssageExpanded=mod((11-mod(lengthOfMessage,11)),11)+lengthOfMessage;
lengthOfEncodedMessage=lengthOfMesssageExpanded*(15/11);
MessageTruncated = [zeros(1,lengthOfMesssageExpanded-lengthOfMessage),Message];
EncodedMessage=zeros([1 floor(lengthOfEncodedMessage)]);
Iterator=lengthOfMesssageExpanded/11;
for i = 1:Iterator
  EncodedMessage(15*(i-1)+1:15*(i-1)+15)=rem(MessageTruncated(11*(i-1)+1:11*(i-1)+11)*G,2);
end



